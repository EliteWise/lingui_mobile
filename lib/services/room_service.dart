// room_service.dart
import 'dart:convert';
import '../models/discussion.dart';
import 'package:http/http.dart' as http;

Future<String> createRoom(Discussion discussion) async {
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/createRoom'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(discussion),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      print(responseJson);
      return responseJson['id'];
    } else {
      print('Failed to create room: ${response.statusCode}');
      throw Exception('Failed to create room');
    }
  } catch (e) {
    print('Failed to create room: $e');
    throw Exception('Failed to create room: $e');
  }
}
