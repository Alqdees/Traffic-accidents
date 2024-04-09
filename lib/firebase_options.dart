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
    apiKey: 'AIzaSyDA48xCtzmNCZ2Dysndg4Tzbwz9Fdtn1CY',
    appId: '1:476341534531:web:67b98f7cfd513c6bc4f9f6',
    messagingSenderId: '476341534531',
    projectId: 'traffic-accidents-50a2b',
    authDomain: 'traffic-accidents-50a2b.firebaseapp.com',
    storageBucket: 'traffic-accidents-50a2b.appspot.com',
    measurementId: 'G-XJXTSGPFWY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_1g4mh1iY7nEkRczMHlMr0mE9ocDcJpA',
    appId: '1:476341534531:android:24118340f71fa92dc4f9f6',
    messagingSenderId: '476341534531',
    projectId: 'traffic-accidents-50a2b',
    storageBucket: 'traffic-accidents-50a2b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBviLkj2NTA4g419sqH5UIAZFhfbdbeZ50',
    appId: '1:476341534531:ios:15b799356fdfbaf9c4f9f6',
    messagingSenderId: '476341534531',
    projectId: 'traffic-accidents-50a2b',
    storageBucket: 'traffic-accidents-50a2b.appspot.com',
    iosBundleId: 'com.example.trafic',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBviLkj2NTA4g419sqH5UIAZFhfbdbeZ50',
    appId: '1:476341534531:ios:09435240c2141047c4f9f6',
    messagingSenderId: '476341534531',
    projectId: 'traffic-accidents-50a2b',
    storageBucket: 'traffic-accidents-50a2b.appspot.com',
    iosBundleId: 'com.example.trafic.RunnerTests',
  );
}
