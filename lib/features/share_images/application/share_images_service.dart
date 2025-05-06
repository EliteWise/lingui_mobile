import 'package:lingui_mobile/common_services/request_service.dart';
import 'package:lingui_mobile/utils/api_routes.dart';

class ShareImagesService {

  final RequestService dio;

  ShareImagesService({required this.dio});

  Future<dynamic> fetchImages({String? country, bool? popular = false, bool? mostRecent = false}) async {
    final queryParams = <String, String>{};

    if (country != null) queryParams['country'] = country;
    if (popular != null) queryParams['popular'] = popular.toString();
    if (mostRecent != null) queryParams['mostRecent'] = mostRecent.toString();

    final uri = Uri.parse(ApiRoutes.getImages).replace(queryParameters: queryParams);

    try {
      final response = await dio.getUri(uri, null, method: "fetchImages");
      return response.data;
    } catch (e) {
      print('Error fetching community: $e');
      return null;
    }
  }
}