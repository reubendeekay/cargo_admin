// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB3BkM91volK3wWXgaNlqLxCKfVABMbRHQ',
    appId: '1:953174779821:web:7e24cd0fffb888dfd5a324',
    messagingSenderId: '953174779821',
    projectId: 'cargo-9420a',
    authDomain: 'cargo-9420a.firebaseapp.com',
    storageBucket: 'cargo-9420a.appspot.com',
    measurementId: 'G-8LNSPF3XVQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCy7yybxTRySr3_AjY-SDhU65WHUFpD7D8',
    appId: '1:953174779821:android:8e219b76bda19b49d5a324',
    messagingSenderId: '953174779821',
    projectId: 'cargo-9420a',
    storageBucket: 'cargo-9420a.appspot.com',
  );
}
