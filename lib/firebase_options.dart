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
    apiKey: 'AIzaSyADcWM49QbukUzB8kKEIa54L5dnimxdPNA',
    appId: '1:1029390931893:web:078165bc0c1be8aa21ebfc',
    messagingSenderId: '1029390931893',
    projectId: 'chatapp-ea119',
    authDomain: 'chatapp-ea119.firebaseapp.com',
    storageBucket: 'chatapp-ea119.appspot.com',
    measurementId: 'G-14MDRQY0TD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAw5g1jcpTSEXrngcopWGz4YLj4Y1fvmQQ',
    appId: '1:1029390931893:android:321e8d4146311c7121ebfc',
    messagingSenderId: '1029390931893',
    projectId: 'chatapp-ea119',
    storageBucket: 'chatapp-ea119.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCz1eKEe9Lr5ujJLbIlxuyrBR0wsL5bMek',
    appId: '1:1029390931893:ios:99319987a75f29fe21ebfc',
    messagingSenderId: '1029390931893',
    projectId: 'chatapp-ea119',
    storageBucket: 'chatapp-ea119.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCz1eKEe9Lr5ujJLbIlxuyrBR0wsL5bMek',
    appId: '1:1029390931893:ios:99319987a75f29fe21ebfc',
    messagingSenderId: '1029390931893',
    projectId: 'chatapp-ea119',
    storageBucket: 'chatapp-ea119.appspot.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyADcWM49QbukUzB8kKEIa54L5dnimxdPNA',
    appId: '1:1029390931893:web:c122576d9519b30521ebfc',
    messagingSenderId: '1029390931893',
    projectId: 'chatapp-ea119',
    authDomain: 'chatapp-ea119.firebaseapp.com',
    storageBucket: 'chatapp-ea119.appspot.com',
    measurementId: 'G-XKC339J8R2',
  );
}