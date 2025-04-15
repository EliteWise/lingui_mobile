import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lingui_mobile/services/appwrite_auth_service.dart';
import 'package:lingui_mobile/services/google_auth_service.dart';
import 'package:lingui_mobile/services/request_service.dart';
import 'package:lingui_mobile/states/provider_appwrite.dart';

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

