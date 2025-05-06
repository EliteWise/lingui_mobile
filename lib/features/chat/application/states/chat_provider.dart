import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/chat/application/isar_service.dart';

import '../../../../common_services/request_service.dart';
import '../../../../common_services/states/request_provider.dart';
import '../room_service.dart';

final isarProvider = Provider<IsarService>((ref) {
  return IsarService();
});

final roomProvider = Provider<RoomService>((ref) {
  final RequestService requestService = ref.watch(requestServiceProvider);
  return RoomService(dio: requestService);
});
