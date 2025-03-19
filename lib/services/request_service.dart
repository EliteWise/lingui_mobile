import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'http://192.168.1.207:5005/api',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 5)
));

Future<dynamic> post(String path, Object? data) async {
  try {
    Response response = await dio.post(path, data: {data});
    return response.data;
  } catch (e) {
    print('POST error: $e');
    return null;
  }
}

Future<dynamic> get(String path) async {
  try {
    Response response = await dio.get(path);
    return response.data;
  } catch (e) {
    print('GET error: $e');
    return null;
  }
}