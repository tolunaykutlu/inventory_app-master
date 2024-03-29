// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBz5_xqNRShsb0jAGQS-Ah3Kvi5nQ8__sY',
    appId: '1:295176607495:web:164e7f9c054ba07063d7a2',
    messagingSenderId: '295176607495',
    projectId: 'work-tracker-3bfc9',
    authDomain: 'work-tracker-3bfc9.firebaseapp.com',
    storageBucket: 'work-tracker-3bfc9.appspot.com',
    measurementId: 'G-JGLZHGC8DZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDH2h0CnuB8O6M3AsMBbdf6s0x-I2u403I',
    appId: '1:295176607495:android:1d3ff4bf2abc16d163d7a2',
    messagingSenderId: '295176607495',
    projectId: 'work-tracker-3bfc9',
    storageBucket: 'work-tracker-3bfc9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtCjHIiBqIfqLqcgDI2r-GtDXQbjoIJjI',
    appId: '1:295176607495:ios:49745d1fa995fbab63d7a2',
    messagingSenderId: '295176607495',
    projectId: 'work-tracker-3bfc9',
    storageBucket: 'work-tracker-3bfc9.appspot.com',
    iosBundleId: 'com.example.inventoryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCtCjHIiBqIfqLqcgDI2r-GtDXQbjoIJjI',
    appId: '1:295176607495:ios:39319bcbc0b5ac6a63d7a2',
    messagingSenderId: '295176607495',
    projectId: 'work-tracker-3bfc9',
    storageBucket: 'work-tracker-3bfc9.appspot.com',
    iosBundleId: 'com.example.inventoryApp.RunnerTests',
  );
}
