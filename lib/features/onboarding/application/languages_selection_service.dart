import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/utils/api_routes.dart';
import 'package:dio/dio.dart';

class LanguagesSelectionService {
  final RequestService dio;

  LanguagesSelectionService({required this.dio});

  Future<Response> addLanguages(String native, String learning) async {
    final data = {'native': native, 'learning': learning};
    return await dio.post(ApiRoutes.addLanguages, data, null);
  }
}