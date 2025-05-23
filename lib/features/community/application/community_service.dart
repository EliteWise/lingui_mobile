import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:lingui_mobile/utils/api_routes.dart';

class CommunityService {

  final RequestService dio;

  CommunityService({required this.dio});

  Future<List<Profile>> fetchCommunity({int? age, String? gender, String? lang}) async {
    final queryParams = <String, String>{};

    if (age != null) queryParams['age'] = age.toString();
    if (gender != null) queryParams['gender'] = gender;
    if (lang != null) queryParams['lang'] = lang;

    final uri = Uri.parse(ApiRoutes.getCommunity).replace(queryParameters: queryParams);

    try {
      final response = await dio.getUri(uri, null, method: "fetchCommunity");
      return response.data;
    } catch (e) {
      print('Error fetching community: $e');
      return [];
    }
  }
}