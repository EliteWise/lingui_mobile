import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:lingui_mobile/utils/api_routes.dart';
import 'package:dio/dio.dart';

class LanguagesSelectionService {
  final RequestService dio;

  LanguagesSelectionService({required this.dio});

  Future<Response> addLanguages(Profile profile) async {
    final data = profile.toJson();
    return await dio.post(ApiRoutes.addLanguages, data, null);
  }
}