import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier {

  GoogleSignInAccount? _user;
  String? _error;

  GoogleSignInAccount? get user => _user;
  String? get error => _error;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      _error = null;
      _user = await _googleSignIn.signIn();
      if(_user == null) return;
      notifyListeners();
    } catch(error) {
      _error = 'Failed to sign in with Google: $error';
      print(error);
    }
  }

  Future<void> _handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      _user = null;
    } catch(error) {
      _error = 'Failed to sign out with Google: $error';
      print(error);
    }
  }
}

