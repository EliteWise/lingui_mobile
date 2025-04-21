class Leaderboard {
  final int id;
  final String userId;
  final String userName;
  final int streak;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Leaderboard({
    required this.id,
    required this.userId,
    required this.userName,
    required this.streak,
    this.createdAt,
    this.updatedAt,
  });

  factory Leaderboard.fromJson(Map<String, dynamic> json) {
    return Leaderboard(
      id: json['id'],
      userId: json['user_id'],
      userName: json['user_name'],
      streak: json['streak'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'streak': streak,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
