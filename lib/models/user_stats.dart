class UserStats {
  final String id;
  final String profileId;
  final int followersCount;
  final int followingCount;
  final int imagesPostedCount;
  final int audiosPostedCount;
  final int audiosListenedCount;
  final int bookmarksCount;
  final int appreciationsCount;
  final DateTime? updatedAt;

  UserStats({
    required this.id,
    required this.profileId,
    this.followersCount = 0,
    this.followingCount = 0,
    this.imagesPostedCount = 0,
    this.audiosPostedCount = 0,
    this.audiosListenedCount = 0,
    this.bookmarksCount = 0,
    this.appreciationsCount = 0,
    this.updatedAt,
  });

  factory UserStats.fromJson(Map<String, dynamic> json) {
    return UserStats(
      id: json['id'],
      profileId: json['profile_id'],
      followersCount: json['followers_count'] ?? 0,
      followingCount: json['following_count'] ?? 0,
      imagesPostedCount: json['images_posted_count'] ?? 0,
      audiosPostedCount: json['audios_posted_count'] ?? 0,
      audiosListenedCount: json['audios_listened_count'] ?? 0,
      bookmarksCount: json['bookmarks_count'] ?? 0,
      appreciationsCount: json['appreciations_count'] ?? 0,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profileId,
      'followers_count': followersCount,
      'following_count': followingCount,
      'images_posted_count': imagesPostedCount,
      'audios_posted_count': audiosPostedCount,
      'audios_listened_count': audiosListenedCount,
      'bookmarks_count': bookmarksCount,
      'appreciations_count': appreciationsCount,
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
