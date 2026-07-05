import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

      if (kDebugMode) {
        debugPrint("Access Token موجود؟ ${googleAuth.accessToken != null}");
        debugPrint("ID Token موجود؟ ${googleAuth.idToken != null}");
        debugPrint("User Email: ${googleUser.email}");
        debugPrint("🔑 Google ID Token: ${googleAuth.idToken?.substring(0, 50)}...");
      }

      if (googleAuth.idToken == null) {
        if (kDebugMode) {
          debugPrint("❌ ID Token is null → check Firebase/Web Client ID");
        }
        return null;
      }

      // ✅ Return Google's ID Token directly (NOT Firebase token)
      return googleAuth.idToken;
    } catch (e) {
      if (kDebugMode) {
        debugPrint("Google Auth Error: $e");
      }
      return null;
    }
  }

  // Optional: Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _googleSignIn.disconnect();
    await _auth.signOut();
  }
}
