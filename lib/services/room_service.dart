// room_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lingui_mobile/models/discussion.dart';

Future<String> createRoom(Discussion discussion) async {
  final response = await http.post(Uri.parse('http://10.0.2.2:8080/createRoom'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(discussion)
  );
  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to create room');
  }
}