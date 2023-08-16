import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCL6_yH0H0UYYOPecKemVTHGo2wuLSdDkE',
    appId: '1:1093442052270:android:733e18447a83292a10cd3f',
    messagingSenderId: '1093442052270',
    projectId: 'project-1093442052270',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCL6_yH0H0UYYOPecKemVTHGo2wuLSdDkE',
    appId: '1:1093442052270:android:733e18447a83292a10cd3f',
    messagingSenderId: '1093442052270',
    projectId: 'project-1093442052270',
    authDomain: 'dsi-mobile-unname.firebaseapp.com',
    storageBucket: 'dsi-mobile-unname.appspot.com',
  );
}
