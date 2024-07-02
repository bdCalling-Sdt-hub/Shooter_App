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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaGCTew6ETTLPXWAsacRN2GbG02Nn0Jso',
    appId: '1:97366805463:android:f16c0208f4b24f48805992',
    messagingSenderId: '97366805463',
    projectId: 'shooter-app-12a65',
    storageBucket: 'shooter-app-12a65.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB_3MEOdjjDc76shB3E3Hl6EyJFw26nTtQ',
    appId: '1:97366805463:ios:f144cc3e16ba02d4805992',
    messagingSenderId: '97366805463',
    projectId: 'shooter-app-12a65',
    storageBucket: 'shooter-app-12a65.appspot.com',
    androidClientId: '97366805463-46j4riijjekr6np9ipv90i0dujqeoi7a.apps.googleusercontent.com',
    iosClientId: '97366805463-kl1r45idhn7bmpchp0243o70inaa3i48.apps.googleusercontent.com',
    iosBundleId: 'com.arnold.techaimshooting',
  );

}