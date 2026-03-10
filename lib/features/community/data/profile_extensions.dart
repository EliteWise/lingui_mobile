import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:appwrite/models.dart' as appwrite;

extension ProfileExtensions on Profile {

  bool isNewUser(appwrite.User user) {
    final registrationDate = DateTime.parse(user.registration);
    return DateTime.now().difference(registrationDate) < const Duration(days: 3);
  }

}