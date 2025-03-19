import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:appwrite/appwrite.dart';

import '../services/auth_service.dart';

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

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref);
});

