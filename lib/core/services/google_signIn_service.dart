import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  // Future<String?> getGoogleIdToken() async {
  //   try {
  //     final googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) return null;

  //     final googleAuth = await googleUser.authentication;
  //     return googleAuth.idToken;
  //   } catch (e) {
  //     print("Google Auth Error: $e");
  //     return null;
  //   }
  // }

  Future<String?> getFirebaseIdToken() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      final firebaseToken = await userCredential.user?.getIdToken();

      return firebaseToken;
    } catch (e) {
      print("Google Auth Error: $e");
      return null;
    }
  }
}
