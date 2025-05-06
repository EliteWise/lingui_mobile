import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/utils/api_routes.dart';
import 'package:dio/dio.dart';

class ProfileInfoService {
  final RequestService dio;

  ProfileInfoService({required this.dio});

  Future<Response> addProfileInfo(XFile? image, DateTime birthdate, Set<String> badges) async {
    final data = {'birthdate': birthdate, 'badges': badges, 'image': image};
    return await dio.post(ApiRoutes.addProfileInfo, data, null);
  }
}