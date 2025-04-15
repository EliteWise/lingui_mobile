import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Account _account;

  GoogleSignInAccount? _user;

  GoogleAuthService(this._account);

  GoogleSignInAccount? get user => _user;
  bool get isSignedIn => _user != null;

  Future<bool> login() async {
    try {
      _user = await _googleSignIn.signIn();
      if (_user == null) return false;

      await _account.createOAuth2Session(provider: OAuthProvider.google);

      await _account.get();

      return true;

    } catch (e) {
      print("Google sign-in error: $e");
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      _user = null;
    } catch (e) {
      print("Google sign-out error: $e");
    }
  }
}
