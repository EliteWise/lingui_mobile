import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';
import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/features/auth/application/user_service.dart';

import '../../../../common_services/states/request_provider.dart';
import '../appwrite_auth_service.dart';
import '../auth_service.dart';
import '../google_auth_service.dart';

final appwriteClientProvider = Provider<Client>((ref) {
  Client client = Client()
      .setEndpoint('http://192.168.1.207/v1') // 10.0.2.2 or localhost
      .setProject('67b9fccc00050ed48c26')
      .setSelfSigned(status: true);
  return client;
});

final accountProvider = Provider<Account>((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

final userProvider = FutureProvider<User>((ref) async {
  final account = ref.watch(accountProvider);
  return await account.get();
});

final googleAuthProvider = Provider<GoogleAuthService>((ref) {
  final account = ref.watch(accountProvider);
  return GoogleAuthService(account);
});

final appwriteAuthProvider = Provider<AppwriteAuthService>((ref) {
  final account = ref.watch(accountProvider);
  return AppwriteAuthService(account);
});

final userAuthProvider = Provider<UserService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return UserService(requestService);
});

final authServiceProvider = Provider<AuthService>((ref) {
  final googleAuth = ref.watch(googleAuthProvider);
  final appwriteAuth = ref.watch(appwriteAuthProvider);
  final userAuth = ref.watch(userAuthProvider);
  return AuthService(googleAuth, appwriteAuth, userAuth);
});
