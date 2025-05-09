import 'package:lingui_mobile/common_services/request_service.dart';

class UserService {

  final RequestService dio;

  UserService(this.dio);

  Future<bool> userExists(String email) async {
    final response = await dio.get('/user/exists?email=$email', null, method: "userExists");
    return response != null && response['exists'] == true;
  }

}

