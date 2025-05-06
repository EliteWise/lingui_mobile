import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/share_images/application/share_images_service.dart';

import '../../../../common_services/states/request_provider.dart';

final shareImagesProvider = Provider<ShareImagesService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return ShareImagesService(dio: requestService);
});