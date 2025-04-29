import 'package:dio/dio.dart';
import 'package:lingui_mobile/utils/network_interceptor.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'http://192.168.1.207:8080',
  connectTimeout: const Duration(seconds: 15),
  receiveTimeout: const Duration(seconds: 15)
))..interceptors.add(NetworkInterceptor());

Future<dynamic> post(String path, Object? data, Map<String, String>? headers) async {
  try {
    Response response = await dio.post(path, data: data, options: Options(headers: headers));
    return response.data;
  } catch (e) {
    print('POST error: $e');
    return null;
  }
}

Future<dynamic> put(String path, Object? data, Map<String, String>? headers) async {
  try {
    Response response = await dio.put(path, data: data, options: Options(headers: headers));
    return response.data;
  } catch (e) {
    print('PUT error: $e');
    return null;
  }
}

Future<dynamic> get(String path, Map<String, String>? headers) async {
  try {
    Response response = await dio.get(path, options: Options(headers: headers));
    return response.data;
  } catch (e) {
    print('GET error: $e');
    return null;
  }
}

Future<dynamic> delete(String path, Map<String, String>? headers) async {
  try {
    Response response = await dio.delete(path, options: Options(headers: headers));
    return response.data;
  } catch (e) {
    print('DELETE error: $e');
    return null;
  }
}