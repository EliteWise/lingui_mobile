import 'package:dio/dio.dart';
import 'package:lingui_mobile/features/auth/application/appwrite_auth_service.dart';
import 'package:lingui_mobile/utils/network_interceptor.dart';

class RequestService {
  final Dio dio;
  final AppwriteAuthService? appwriteAuthService;

  RequestService({this.appwriteAuthService}) : dio = Dio(BaseOptions(
      baseUrl: 'http://192.168.1.207:8080',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15)
  )) {
    if (appwriteAuthService != null) {
      dio.interceptors.add(NetworkInterceptor(getJwt: appwriteAuthService!.createJWT));
    }
  }

  Future<dynamic> post(String path, Object? data, Map<String, String>? headers, {String method = 'POST'}) async {
    try {
      Response response = await dio.post(path, data: data, options: Options(headers: headers));
      return response.data;
    } catch (e) {
      _handleError(e, method);
    }
  }

  Future<dynamic> put(String path, Object? data, Map<String, String>? headers, {String method = 'PUT'}) async {
    try {
      Response response = await dio.put(path, data: data, options: Options(headers: headers));
      return response.data;
    } catch (e) {
      _handleError(e, method);
    }
  }

  Future<dynamic> get(String path, Map<String, String>? headers, {String method = 'GET'}) async {
    try {
      Response response = await dio.get(path, options: Options(headers: headers));
      return response.data;
    } catch (e) {
      _handleError(e, method);
    }
  }

  Future<dynamic> getUri(Uri uri, Map<String, String>? headers, {String method = 'GET URI'}) async {
    try {
      Response response = await dio.getUri(uri, options: Options(headers: headers));
      return response.data;
    } catch (e) {
      _handleError(e, method);
    }
  }

  Future<dynamic> delete(String path, Map<String, String>? headers, {String method = 'DELETE'}) async {
    try {
      Response response = await dio.delete(path, options: Options(headers: headers));
      return response.data;
    } catch (e) {
      _handleError(e, method);
    }
  }

  dynamic _handleError(dynamic e, String method) {
    if (e is DioException) {
      String errorMessage = '[Request failed in $method] [${e.response?.statusCode}] : ${e.message}';
      throw Exception(errorMessage);
    } else {
      throw Exception('Unexpected error in $method: ${e.toString()}');
    }

  }

}