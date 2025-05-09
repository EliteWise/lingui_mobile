import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/auth/application/states/auth_provider.dart';

import '../request_service.dart';

final requestServiceProvider = Provider<RequestService>((ref) {
  final appwriteAuthService = ref.watch(appwriteAuthProvider);
  return RequestService(appwriteAuthService: appwriteAuthService);
});