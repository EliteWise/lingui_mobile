import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/onboarding/application/languages_selection_service.dart';

import '../../../../common_services/states/request_provider.dart';
import '../profile_info_service.dart';

final languageSelectionProvider = Provider<LanguagesSelectionService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return LanguagesSelectionService(dio: requestService);
});

final profileInfoProvider = Provider<ProfileInfoService>((ref) {
  final requestService = ref.watch(requestServiceProvider);
  return ProfileInfoService(dio: requestService);
});