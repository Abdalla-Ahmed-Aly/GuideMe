import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton()
class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // serverClientId:
    //     '104478032373-79ppbq9pr3cf0pgm87vi7njffqet613j.apps.googleusercontent.com',
        
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  Future<String?> getFirebaseIdToken() async {
    try {
      _logger.i("Starting Google Sign-In process...");
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        _logger.w("Google Sign-In: User cancelled the flow.");
        return null;
      }

      _logger.i("Google User signed in: ${googleUser.email}");
      final googleAuth = await googleUser.authentication;
      final googleIdToken = googleAuth.idToken;
      _logger.d(
        "Retrieved Google Auth credentials. Google ID Token: $googleIdToken",
      );

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _logger.i("Signing in to Firebase with Google credentials...");
      final userCredential = await _auth.signInWithCredential(credential);
      _logger.i(
        "Firebase sign-in successful for: ${userCredential.user?.email}",
      );

      // final firebaseToken = await userCredential.user?.getIdToken();
      // _logger.d("Firebase ID Token: $firebaseToken");

      // For debugging, we'll return the Google ID Token first if it's available
      // because many backends expect the Google token directly.
      // If the backend strictly needs Firebase, we'll revert.
      return googleIdToken ;
    } catch (e, stackTrace) {
      _logger.e("Google Auth Error: $e", error: e, stackTrace: stackTrace);
      return null;
    }
  }
}
