import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../request_service.dart';

final requestServiceProvider = Provider<RequestService>((ref) {
  return RequestService();
});