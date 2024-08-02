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
    apiKey: 'AIzaSyDxlfP9oG2If2Z51frRIZ9GM4EOe11T0qM',
    appId: '1:366599415321:web:e57721ee9e5579b23aac88',
    messagingSenderId: '366599415321',
    projectId: 'travel-weather-app-48f4f',
    authDomain: 'travel-weather-app-48f4f.firebaseapp.com',
    storageBucket: 'travel-weather-app-48f4f.appspot.com',
    measurementId: 'G-B514XWWX1Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAexsJ-la2gg4qiwJ3nL8AH9MQ5ROWaDfE',
    appId: '1:366599415321:android:27491bfa90f262ee3aac88',
    messagingSenderId: '366599415321',
    projectId: 'travel-weather-app-48f4f',
    storageBucket: 'travel-weather-app-48f4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIn0mQrFMvQnOw7OUMkPhpkWoyKJcqSBs',
    appId: '1:366599415321:ios:de5ce58c9d21e2713aac88',
    messagingSenderId: '366599415321',
    projectId: 'travel-weather-app-48f4f',
    storageBucket: 'travel-weather-app-48f4f.appspot.com',
    iosBundleId: 'com.example.travelWeatherApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIn0mQrFMvQnOw7OUMkPhpkWoyKJcqSBs',
    appId: '1:366599415321:ios:de5ce58c9d21e2713aac88',
    messagingSenderId: '366599415321',
    projectId: 'travel-weather-app-48f4f',
    storageBucket: 'travel-weather-app-48f4f.appspot.com',
    iosBundleId: 'com.example.travelWeatherApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDxlfP9oG2If2Z51frRIZ9GM4EOe11T0qM',
    appId: '1:366599415321:web:4888709d7245912a3aac88',
    messagingSenderId: '366599415321',
    projectId: 'travel-weather-app-48f4f',
    authDomain: 'travel-weather-app-48f4f.firebaseapp.com',
    storageBucket: 'travel-weather-app-48f4f.appspot.com',
    measurementId: 'G-LLRWSFV8HV',
  );
}
