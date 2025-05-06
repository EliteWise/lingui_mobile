class ApiRoutes {
  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // User
  // TODO

  // Profile
  static String getProfile(String id) => '/profile/$id';
  static const String updateProfile = '/profile/update';
  static const String addLanguages = '/profile/languages';
  static const String addProfileInfo = '/profile/info';

  // Images
  static const String addImages = '/user/images';
  static const String getImages = '/user/images';
  static String deleteImage(String imageId) => '/user/images/delete/$imageId';

  // Chat
  static const String getChat = '/chat';
  static const String addChatMessage = '/chat/message';
  static const String createRoom = '/chat/room';
  static const String getRooms = '/chat/rooms';

  // Ranking
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
