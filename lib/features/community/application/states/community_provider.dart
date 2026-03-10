
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/auth/application/states/auth_provider.dart';

import '../../../../common_services/states/request_provider.dart';
import '../../data/profile.dart';
import '../community_service.dart';

final communityServiceProvider = Provider<CommunityService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return CommunityService(dio: requestService);
});

final fetchProfileProvider = FutureProvider<Profile>((ref) async {
  final auth = ref.watch(appwriteAuthProvider);
  final profileId = await auth.currentUserId;

  if (profileId == null) {
    throw Exception('Utilisateur non authentifié.');
  }

  final communityService = ref.watch(communityServiceProvider);
  return await communityService.fetchProfile(profileId);
});