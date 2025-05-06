// room_service.dart
import 'dart:convert';

import '../../../common_services/request_service.dart';
import '../data/discussion.dart';

class RoomService {

  final RequestService dio;

  RoomService({required this.dio});

  Future<dynamic> createRoom(Discussion discussion) async {
    try {
      final response = await dio.post('http://10.0.2.2:8080/createRoom', discussion.toJson(),
          <String, String>{
        'Content-Type': 'application/json',
      }, method: "createRoom");

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
}


