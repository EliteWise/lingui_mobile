
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_services/states/request_provider.dart';
import '../community_service.dart';

final communityServiceProvider = Provider<CommunityService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return CommunityService(dio: requestService);
});