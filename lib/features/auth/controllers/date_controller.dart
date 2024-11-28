import 'package:dio/dio.dart';
import 'package:flutter_tem/features/auth/models/auth_model.dart';
import 'package:flutter_tem/utils/api/dio_client.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var counter = 0.obs;
  var photos = <AuthModel>[].obs; // Observable list of Photo objects
  var isLoading = false.obs; // Observable for loading state
  var errorMessage = ''.obs;
  final Dio dio = DioClient.dioNoAuth;

  void increment() {
    counter++;
  }

  void decrement() {
    counter--;
  }

  Future<void> getPhotos() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await dio.get('/photos');
      photos.assignAll((response.data as List<dynamic>)
          .map((json) => AuthModel.fromJson(json))
          .toList());
    } catch (e) {
      errorMessage('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
