import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        "339882358219-jesp74gb1djqeuge5lcpagje11gkuu3f.apps.googleusercontent.com",
    scopes: [
      'email',
    ],
  );

  Future<String?> getFirebaseIdToken() async {
    try {
      // Start Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        print("❌ User cancelled Google Sign-In");
        return null;
      }

      // Get authentication tokens
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      print("Access Token موجود؟ ${googleAuth.accessToken != null}");
      print("ID Token موجود؟ ${googleAuth.idToken != null}");
      print("User Email: ${googleUser.email}");

      // لازم يكون فيه ID Token
      if (googleAuth.idToken == null) {
        print("❌ ID Token is null → check Firebase/Web Client ID");
        return null;
      }

      // Create Firebase credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final User? user = userCredential.user;

      if (user == null) {
        print("❌ Firebase user is null");
        return null;
      }

      // Get Firebase ID Token
      final String? firebaseToken = await user.getIdToken();

      print("✅ Firebase ID Token: $firebaseToken");

      return firebaseToken;
    } catch (e) {
      print("🔥 Google Auth Error: $e");

      if (e.toString().contains("ApiException: 10")) {
        print("❌ DEVELOPER_ERROR → تأكد من:");
        print("- SHA-1");
        print("- Package Name");
        print("- Web Client ID");
      }

      return null;
    }
  }

  // Optional: Sign out
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
