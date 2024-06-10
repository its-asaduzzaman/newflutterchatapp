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
    apiKey: 'AIzaSyBY9l4xbA3HsrRisrWeRDecqJoVx4P0QEk',
    appId: '1:52790497968:web:18f351b011753be1ab2175',
    messagingSenderId: '52790497968',
    projectId: 'chatapptuto2024',
    authDomain: 'chatapptuto2024.firebaseapp.com',
    storageBucket: 'chatapptuto2024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPnAvsz27zxsDQQl18n_K6bB5jXJ1aBKI',
    appId: '1:52790497968:android:5d0fa0e2e1dfc6c7ab2175',
    messagingSenderId: '52790497968',
    projectId: 'chatapptuto2024',
    storageBucket: 'chatapptuto2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyByJl9cMgyPrB5-4JjtZtDS7YPW7rpSqTI',
    appId: '1:52790497968:ios:260313c8ca4ec95cab2175',
    messagingSenderId: '52790497968',
    projectId: 'chatapptuto2024',
    storageBucket: 'chatapptuto2024.appspot.com',
    iosBundleId: 'com.example.newflutterchatappwithfirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyByJl9cMgyPrB5-4JjtZtDS7YPW7rpSqTI',
    appId: '1:52790497968:ios:260313c8ca4ec95cab2175',
    messagingSenderId: '52790497968',
    projectId: 'chatapptuto2024',
    storageBucket: 'chatapptuto2024.appspot.com',
    iosBundleId: 'com.example.newflutterchatappwithfirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBY9l4xbA3HsrRisrWeRDecqJoVx4P0QEk',
    appId: '1:52790497968:web:92dbae57ea10356bab2175',
    messagingSenderId: '52790497968',
    projectId: 'chatapptuto2024',
    authDomain: 'chatapptuto2024.firebaseapp.com',
    storageBucket: 'chatapptuto2024.appspot.com',
  );
}
