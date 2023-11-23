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
    apiKey: 'AIzaSyDLOKcWDRrm52aw0wVHiNvRokffk3icj44',
    appId: '1:246260250061:web:c497c4c5586453be48c084',
    messagingSenderId: '246260250061',
    projectId: 'fir-login-e349e',
    authDomain: 'fir-login-e349e.firebaseapp.com',
    storageBucket: 'fir-login-e349e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmJTgxGPJQQlw38xCXo7E85srwa66Tm4w',
    appId: '1:246260250061:android:b2724e1c5fe90d4748c084',
    messagingSenderId: '246260250061',
    projectId: 'fir-login-e349e',
    storageBucket: 'fir-login-e349e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY8l20RuRINKMt0RoFCovcAOxdb5tMaW0',
    appId: '1:246260250061:ios:3d8e39b40f5227e748c084',
    messagingSenderId: '246260250061',
    projectId: 'fir-login-e349e',
    storageBucket: 'fir-login-e349e.appspot.com',
    iosClientId: '246260250061-6dj9dv0pcb0ie5p513ia38000q4irtss.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCY8l20RuRINKMt0RoFCovcAOxdb5tMaW0',
    appId: '1:246260250061:ios:be6567de260ab39248c084',
    messagingSenderId: '246260250061',
    projectId: 'fir-login-e349e',
    storageBucket: 'fir-login-e349e.appspot.com',
    iosClientId: '246260250061-u8ou0agbue4clf81pqarrhk4ebehkd6r.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLogin.RunnerTests',
  );
}