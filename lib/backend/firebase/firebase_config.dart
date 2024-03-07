import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDk_HwxSeFJPeogw6UfiJW-XmZ5mwLu5dY",
            authDomain: "shopsync-a8aa2.firebaseapp.com",
            projectId: "shopsync-a8aa2",
            storageBucket: "shopsync-a8aa2.appspot.com",
            messagingSenderId: "108471590770",
            appId: "1:108471590770:web:553be04c675a622b3507eb",
            measurementId: "G-LP39EC3QS9"));
  } else {
    await Firebase.initializeApp();
  }
}
