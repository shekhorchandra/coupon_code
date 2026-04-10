import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'openid', 'profile'],
    serverClientId: dotenv.env['GOOGLE_LOGIN_CLIENT_ID_WEB'],
  );

  Future<void> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled
        return;
      }

      final googleAuth = await googleUser.authentication;
      final displayName = await googleUser.displayName;
      final email = await googleUser.email;
      final photoUrl = await googleUser.photoUrl;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      debugPrint("Display Name: $displayName");
      debugPrint('Email: $email');
      debugPrint('Photo URL: $photoUrl');
      debugPrint('Access Token: $accessToken');
      debugPrint('ID Token: $idToken');

      // 🛠 Next (optional): send idToken/accessToken to your backend
      // for server‑side verification (OAuth2 token info endpoint)
    } catch (error) {
      print('Google sign-in error: $error');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
