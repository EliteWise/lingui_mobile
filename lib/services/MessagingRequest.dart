import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response> sendMessage(String message) {
  return http.post(
    Uri.parse('http://localhost:8080'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'message': message
    }),
  );
}