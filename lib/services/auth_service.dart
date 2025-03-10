import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingui_mobile/states/provider_appwrite.dart';

class AuthService with ChangeNotifier {

  late final Ref ref;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final Account _account;

  GoogleSignInAccount? _user;
  String? _error;

  GoogleSignInAccount? get user => _user;
  String? get error => _error;
  bool get isSignedIn => _user != null;

  AuthService(this.ref) : _account = ref.read(accountProvider);

  // Used to login with Email
  Future<void> login(String email, String password) async {
    try {
      await _account.createEmailPasswordSession(email: email, password: password);
    } catch (e) {
      print("Login Error: $e");
    }
  }

  Future<void> register(String email, String password, String name) async {
    try {
      await _account.create(
          userId: ID.unique(), email: email, password: password, name: name);
    } catch (e) {
      if (e is AppwriteException && e.code == 409) {
        print("User already exist");
      }
    }

    await login(email, password);
  }

  Future<bool> handleSignIn(email, password, name) async {
    try {
      _error = null;

      // Google Connection
      _user = await _googleSignIn.signIn();
      if(_user == null) return false;

      // Create appwrite session with Google OAuth
      await _account.createOAuth2Session(provider: OAuthProvider.google);

      try {
        await _account.get();
      } catch (e) {
        if (e is AppwriteException) {
          await register(email, password, name);
        } else {
          rethrow;
        }
      }

      notifyListeners();
      return true;
    } catch(error) {
      _error = 'Failed to sign in with Google: $error';
      print(error);
      notifyListeners();
      return false;
    }
  }

  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _account.deleteSession(sessionId: 'current');
      _user = null;
      notifyListeners();
    } catch(error) {
      _error = 'Failed to sign out with Google: $error';
      print(error);
      notifyListeners();
    }
  }
}

