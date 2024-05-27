// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyB8a8EKrvhzec03y2ffkPq_ypf_se9MvJI',
    appId: '1:506695090182:web:8d260be293ffb13497c387',
    messagingSenderId: '506695090182',
    projectId: 'zuccante-app-5ia-2023-2024',
    authDomain: 'zuccante-app-5ia-2023-2024.firebaseapp.com',
    storageBucket: 'zuccante-app-5ia-2023-2024.appspot.com',
    measurementId: 'G-BGM1K40SSC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0_p27h1wXGAKbqsif8qOJSJCyQk3Js48',
    appId: '1:506695090182:android:dd5237e449c7908997c387',
    messagingSenderId: '506695090182',
    projectId: 'zuccante-app-5ia-2023-2024',
    storageBucket: 'zuccante-app-5ia-2023-2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFdQ_Y0_5VfrcR9JxMw5XeCSwebA_Q7-o',
    appId: '1:506695090182:ios:007213524dc4f60d97c387',
    messagingSenderId: '506695090182',
    projectId: 'zuccante-app-5ia-2023-2024',
    storageBucket: 'zuccante-app-5ia-2023-2024.appspot.com',
    androidClientId: '506695090182-ablni0s64d8ato1c66r92p9cet3bbf33.apps.googleusercontent.com',
    iosClientId: '506695090182-uc9mat5clum2idmpiceagiod9qbb2apg.apps.googleusercontent.com',
    iosBundleId: 'com.example.fizook',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFdQ_Y0_5VfrcR9JxMw5XeCSwebA_Q7-o',
    appId: '1:506695090182:ios:007213524dc4f60d97c387',
    messagingSenderId: '506695090182',
    projectId: 'zuccante-app-5ia-2023-2024',
    storageBucket: 'zuccante-app-5ia-2023-2024.appspot.com',
    androidClientId: '506695090182-ablni0s64d8ato1c66r92p9cet3bbf33.apps.googleusercontent.com',
    iosClientId: '506695090182-uc9mat5clum2idmpiceagiod9qbb2apg.apps.googleusercontent.com',
    iosBundleId: 'com.example.fizook',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB8a8EKrvhzec03y2ffkPq_ypf_se9MvJI',
    appId: '1:506695090182:web:af32d234c12a7ab897c387',
    messagingSenderId: '506695090182',
    projectId: 'zuccante-app-5ia-2023-2024',
    authDomain: 'zuccante-app-5ia-2023-2024.firebaseapp.com',
    storageBucket: 'zuccante-app-5ia-2023-2024.appspot.com',
    measurementId: 'G-J5BYY4SMK2',
  );

}