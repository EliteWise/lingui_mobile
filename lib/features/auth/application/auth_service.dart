import 'appwrite_auth_service.dart';
import 'google_auth_service.dart';

class AuthService {

  final GoogleAuthService _googleAuth;
  final AppwriteAuthService _appwriteAuth;

  AuthService(this._googleAuth, this._appwriteAuth);

  Future<bool> get isSignedIn async {
    return await _appwriteAuth.isSignedIn || _googleAuth.isSignedIn;
  }

  Future<bool> authenticateWithEmail(String email, String password) async {
    return await _appwriteAuth.userExists(email)
        ? await _appwriteAuth.login(email, password)
        : await _appwriteAuth.register(email, password);
  }

  Future<bool> authenticateWithGoogle() async {
    bool googleSuccess = await _googleAuth.login();
    if (!googleSuccess) return false;
    return true;
  }


  Future<void> signOut() async {
    await _googleAuth.signOut();
    await _appwriteAuth.signOut();
  }
}

