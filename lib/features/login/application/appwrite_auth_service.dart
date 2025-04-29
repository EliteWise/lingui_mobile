import 'package:appwrite/appwrite.dart';
import 'package:lingui_mobile/common_services/request_service.dart';

class AppwriteAuthService {
  final Account _account;

  AppwriteAuthService(this._account);

  Future<bool> get isSignedIn async {
    try {
      await _account.get();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> userExists(String email) async {
    var response = await get('/user/exists?email=$email', {});
    print(response);
    return response != null && response['exists'] == true;
  }

  Future<bool> login(String email, String password) async {
    try {
      print("Login in progress");
      if (await isSignedIn) return true;
      await _account.createEmailPasswordSession(email: email, password: password);
      return true;
    } catch (e) {
      print("Login Error: $e");
      return false;
    }
  }

  Future<bool> register(String email, String password) async {
    try {
      print("Register in progress");
      if (await isSignedIn) return true;
      await _account.create(userId: ID.unique(), email: email, password: password);
      return true;
    } catch (e) {
      print("Register error");
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');
    } catch (e) {
      print("Appwrite sign-out error: $e");
    }
  }
}
