// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_dev.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCJAtJLF2_lL4GgBvH1NORzQzehsAVzUv8',
    appId: '1:557744721846:web:51c9839e63d376360bbb17',
    messagingSenderId: '557744721846',
    projectId: 'app-dev-faa5c',
    authDomain: 'app-dev-faa5c.firebaseapp.com',
    storageBucket: 'app-dev-faa5c.firebasestorage.app',
    measurementId: 'G-214D16727R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAtzD_ZZpEOnw9d1dZxOomQnow5mFkNeZM',
    appId: '1:557744721846:android:59de08d11d7144230bbb17',
    messagingSenderId: '557744721846',
    projectId: 'app-dev-faa5c',
    storageBucket: 'app-dev-faa5c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfcV70by6KsojsFwRGcY1j8Cc2qPDHw5M',
    appId: '1:557744721846:ios:8e9d26ce9397d4e30bbb17',
    messagingSenderId: '557744721846',
    projectId: 'app-dev-faa5c',
    storageBucket: 'app-dev-faa5c.firebasestorage.app',
    iosBundleId: 'com.menghor.twfurniturekh.dev',
  );
}
