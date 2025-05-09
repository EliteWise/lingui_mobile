import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lingui_mobile/main.dart';

class NetworkInterceptor extends Interceptor {
  final Future<String> Function() getJwt;

  NetworkInterceptor({required this.getJwt});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getJwt();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    print(options.method.toUpperCase());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('${response.statusCode} - ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❗ Lingui Error: [${err.response?.statusCode}] - ${err.requestOptions.uri}');
    print('${err.message}');

    String errorMessage = 'Unknown error occurred';
    int? statusCode = err.response?.statusCode;

    if (statusCode == 500) {
      errorMessage = 'The server encountered a problem, retry later';
    } else if (statusCode == 403) {
      errorMessage = 'You don\'t have access to this page';
    }

    switch (err.type) {
      case DioExceptionType.unknown:
        errorMessage = 'Unknown error occurred';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Unable to connect to the server, please retry';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'It took too long to send the data, please retry';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'The server took too long to respond, please retry';
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        throw UnimplementedError();
    }

    final context = navigatorKey.currentContext;
    if (context != null && errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage))
      );
    }

    handler.next(err);
  }

}