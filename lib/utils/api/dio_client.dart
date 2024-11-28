import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioClient {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static final Dio dioNoAuth = Dio(_baseOptions);
  static final Dio dioWithAuth = Dio(_baseOptions);

  static final Logger logger = Logger(
    filter: null,
    printer: PrettyPrinter(),
    output: null,
  );

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(milliseconds: 400000),
    receiveTimeout: const Duration(milliseconds: 400000),
    contentType: 'application/json',
  );

  static void setup() {
    _addLoggingInterceptor(dioNoAuth);
    _addLoggingInterceptor(dioWithAuth);
    _addAuthInterceptor(dioWithAuth);
    _addErrorInterceptor(dioNoAuth);
    _addErrorInterceptor(dioWithAuth);
  }

  // Add logging interceptor for debugging
  static void _addLoggingInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        logger.d(
            '[REQUEST] [${options.method}] => PATH: ${options.path}, HEADERS: ${options.headers}, DATA: ${options.data}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        logger.i(
            '[RESPONSE] => STATUS: ${response.statusCode}, DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        logger.e(
            '[ERROR] => STATUS: ${e.response?.statusCode}, ERROR: ${e.error}');
        return handler.next(e);
      },
    ));
  }

  static void _addAuthInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // final prefs = await SharedPreferences.getInstance();
        // final token = prefs.getString('authToken');
        // if (token != null) {
        //   options.headers["Authorization"] = "Bearer $token";
        // }
        return handler.next(options);
      },
    ));
  }

  static void _addErrorInterceptor(Dio dio) {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout) {
          logger.w("Network timeout error occurred");
        } else if (e.response?.statusCode == 401) {
          // Handle token expiration or unauthorized access
          logger.w("Unauthorized access - token might have expired");
          await _handleTokenExpiry();
        } else if (e.response?.statusCode == 500) {
          logger.e("Server error occurred");
        } else {
          logger.e("Unexpected error: ${e.message}");
        }
        return handler.next(e);
      },
    ));
  }

  static Future<void> _handleTokenExpiry() async {}

  // Retry logic on transient errors (like timeouts)
  static Future<Response> retryRequest(Dio dio, RequestOptions options,
      {int retries = 3}) async {
    int attempts = 0;
    while (attempts < retries) {
      try {
        // Using RequestOptions directly instead of converting it to Options
        return await dio.request(options.path,
            options: Options(
              method: options.method,
              headers: options.headers,
              responseType: options.responseType,
              contentType: options.contentType,
              validateStatus: options.validateStatus,
              receiveTimeout: options.receiveTimeout,
              sendTimeout: options.sendTimeout,
            ));
      } catch (e) {
        attempts++;
        if (attempts == retries) rethrow;
        await Future.delayed(const Duration(seconds: 2));
      }
    }
    return Future.error("Failed after $retries retries");
  }

  // Add retry logic to requests that may fail due to network issues
  static Future<Response> makeRequestWithRetry(
      Dio dio, RequestOptions options) async {
    try {
      return await retryRequest(dio, options);
    } catch (e) {
      throw DioException(requestOptions: options, error: e);
    }
  }
}
