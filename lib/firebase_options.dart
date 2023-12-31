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
    apiKey: 'AIzaSyBlSoVHae9sJKY2HFfUsPTPK_beWjLp0jo',
    appId: '1:128524533140:web:6fb1f0821f501f4fcae381',
    messagingSenderId: '128524533140',
    projectId: 'crud-9e5d0',
    authDomain: 'crud-9e5d0.firebaseapp.com',
    storageBucket: 'crud-9e5d0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfHZBcQ-bTMQhXJgpUYBIWl6l7088g_VU',
    appId: '1:128524533140:android:400b64323c8ff8a7cae381',
    messagingSenderId: '128524533140',
    projectId: 'crud-9e5d0',
    storageBucket: 'crud-9e5d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBF-BfmUNfv0SauRCgar0p01pAqRhSVoVc',
    appId: '1:128524533140:ios:2aa30eb61b50cc9bcae381',
    messagingSenderId: '128524533140',
    projectId: 'crud-9e5d0',
    storageBucket: 'crud-9e5d0.appspot.com',
    iosBundleId: 'com.example.crud',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBF-BfmUNfv0SauRCgar0p01pAqRhSVoVc',
    appId: '1:128524533140:ios:0c21f9578c13f1dacae381',
    messagingSenderId: '128524533140',
    projectId: 'crud-9e5d0',
    storageBucket: 'crud-9e5d0.appspot.com',
    iosBundleId: 'com.example.crud.RunnerTests',
  );
}
