import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<String?> getFirebaseIdToken() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      print("Access Token موجود؟ ${googleAuth.accessToken != null}");
      print("ID Token موجود؟ ${googleAuth.idToken != null}");
      print("User Email: ${googleUser.email}");
      print("🔑 Google ID Token: ${googleAuth.idToken?.substring(0, 50)}...");

      // لازم يكون فيه ID Token
      if (googleAuth.idToken == null) {
        print("❌ ID Token is null → check Firebase/Web Client ID");
        return null;
      }

      // ✅ Return Google's ID Token directly (NOT Firebase token)
      return googleAuth.idToken;
    } catch (e) {
      print("Google Auth Error: $e");
      return null;
    }
  }

  // Optional: Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
