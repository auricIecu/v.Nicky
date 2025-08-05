import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAFa6X4z87PKKSuRiiMPcF_At1oLTFXun8",
            authDomain: "orito-gpahpe.firebaseapp.com",
            projectId: "orito-gpahpe",
            storageBucket: "orito-gpahpe.firebasestorage.app",
            messagingSenderId: "266163565560",
            appId: "1:266163565560:web:02938d75cd6ad67c741c0d"));
  } else {
    await Firebase.initializeApp();
  }
}
