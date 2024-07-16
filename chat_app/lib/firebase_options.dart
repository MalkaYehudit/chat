import 'package:firebase_core/firebase_core.dart';

class DefaultafirebaseOptions{
  static FirebaseOptions get currentPlatform{
    return android;
}

  static const FirebaseOptions android = 
  FirebaseOptions(
    apiKey:'AIzaSyBzLKtohEQKwJpyfsUZoBSb3n7F576nBkI',
    appId: '1:419076731762:android:dd455b1cb0378a673fe3eb',
    projectId: 'chatapp-a6d38',
    messagingSenderId: '419076731762',
    storageBucket: 'chatapp-a6d38.appspot.com'
     );
}