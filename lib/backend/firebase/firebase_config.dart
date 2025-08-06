import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAVfzi2Bp-A4-kE9O69jKhHfYBD5xCfLns",
            authDomain: "fivestar-push.firebaseapp.com",
            projectId: "fivestar-push",
            storageBucket: "fivestar-push.firebasestorage.app",
            messagingSenderId: "198032920836",
            appId: "1:198032920836:web:c1433ffdcf197be7964051",
            measurementId: "G-9NXKSX82DJ"));
  } else {
    await Firebase.initializeApp();
  }
}
