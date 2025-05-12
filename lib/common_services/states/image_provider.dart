import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/application/states/auth_provider.dart';
import '../image_service.dart';

final imageServiceProvider = Provider<ImageService>((ref) {
  final storage = ref.watch(storageProvider);
  return ImageService(storage: storage);
});