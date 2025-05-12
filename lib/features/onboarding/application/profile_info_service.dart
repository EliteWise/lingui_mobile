import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/utils/api_routes.dart';
import 'package:dio/dio.dart';

import '../../community/data/profile.dart';

class ProfileInfoService {
  final RequestService dio;

  ProfileInfoService({required this.dio});

  Future<Response> addProfileInfo(Profile profile) async {
    final data = profile.toJson();
    return await dio.post(ApiRoutes.addProfileInfo, data, null);
  }
}