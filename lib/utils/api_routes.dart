class ApiRoutes {
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // Profile
  static String getProfile(String id) => '/user/profile/$id';
  static const String updateProfile = '/user/profile/update';
  static const String addLanguages = '/user/languages';
  static const String addProfileInfo = '/user/info';
  static const String addImages = '/user/images';
  static const String getImages = '/user/images';
  static String deleteImage(String imageId) => '/user/images/delete/$imageId';

  // Chat
  static const String chat = '/chat';
  static const String createRoom = '/chat/room';
  static const String getRooms = '/chat/rooms';

  // Rankings
  static const String getMonthlyRanking = '/ranking/monthly';
  static const String getOverallRanking = '/ranking/overall';
  static const String getRanking = '/ranking';
  static const String updateRank = '/ranking/update';

  // Community
  static const String getCommunity = '/community';

  // Settings
  static const String getSettings = '/settings';
  static const String updateSettings = '/settings/update';
}
