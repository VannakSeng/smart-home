import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDKnicZr4xoTVnpQaPEkdvGj9xNdmfjUJg",
            authDomain: "smart-home-5e9a5.firebaseapp.com",
            projectId: "smart-home-5e9a5",
            storageBucket: "smart-home-5e9a5.appspot.com",
            messagingSenderId: "820162712581",
            appId: "1:820162712581:web:3496ab5261f9ebf1eff86c",
            measurementId: "G-38SMJS3X46"));
  } else {
    await Firebase.initializeApp();
  }
}
