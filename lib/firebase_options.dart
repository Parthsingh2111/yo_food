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
    apiKey: 'AIzaSyBFXULIuwNwadUgMxSmausIrVHOfBQCNc8',
    appId: '1:82680530512:web:005fb7ab2adaa197a27355',
    messagingSenderId: '82680530512',
    projectId: 'yofood-2111',
    authDomain: 'yofood-2111.firebaseapp.com',
    storageBucket: 'yofood-2111.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmpgz1Ax8cIIkRKUk9Z9aYqfqngQ-peFg',
    appId: '1:82680530512:android:b5e9d7dad3f0fc77a27355',
    messagingSenderId: '82680530512',
    projectId: 'yofood-2111',
    storageBucket: 'yofood-2111.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAera38vHCQXtT4ShxYWYPcc0tpkmVo7PM',
    appId: '1:82680530512:ios:1ff496ca472770d8a27355',
    messagingSenderId: '82680530512',
    projectId: 'yofood-2111',
    storageBucket: 'yofood-2111.appspot.com',
    androidClientId: '82680530512-vqg603baaf1rdo29955rpckhfh0e5geg.apps.googleusercontent.com',
    iosClientId: '82680530512-4g0tc3loq18nmonsq1pl493iagv0vj60.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAera38vHCQXtT4ShxYWYPcc0tpkmVo7PM',
    appId: '1:82680530512:ios:1ff496ca472770d8a27355',
    messagingSenderId: '82680530512',
    projectId: 'yofood-2111',
    storageBucket: 'yofood-2111.appspot.com',
    androidClientId: '82680530512-vqg603baaf1rdo29955rpckhfh0e5geg.apps.googleusercontent.com',
    iosClientId: '82680530512-4g0tc3loq18nmonsq1pl493iagv0vj60.apps.googleusercontent.com',
    iosBundleId: 'com.example.foodApp',
  );
}
