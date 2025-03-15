class UserFollow {
  final String followerId;
  final String followingId;
  final DateTime? createdAt;

  UserFollow({
    required this.followerId,
    required this.followingId,
    this.createdAt,
  });

  factory UserFollow.fromJson(Map<String, dynamic> json) {
    return UserFollow(
      followerId: json['follower_id'],
      followingId: json['following_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'follower_id': followerId,
      'following_id': followingId,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
