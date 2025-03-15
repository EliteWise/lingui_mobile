class Profile {
  final String id;
  final String userId;
  final String name;
  final String? pictureUrl;
  final DateTime? birthdate;
  final String? location;
  final String? description;
  final String nativeLanguage;
  final int streak;
  final int? streakRank;
  final bool isActiveBadge;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.name,
    this.pictureUrl,
    this.birthdate,
    this.location,
    this.description,
    required this.nativeLanguage,
    this.streak = 0,
    this.streakRank,
    this.isActiveBadge = false,
    this.createdAt,
    this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      pictureUrl: json['picture_url'],
      birthdate: json['birthdate'] != null ? DateTime.parse(json['birthdate']) : null,
      location: json['location'],
      description: json['description'],
      nativeLanguage: json['native_language'],
      streak: json['streak'] ?? 0,
      streakRank: json['streak_rank'],
      isActiveBadge: json['is_active_badge'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
      'picture_url': pictureUrl,
      'birthdate': birthdate?.toIso8601String(),
      'location': location,
      'description': description,
      'native_language': nativeLanguage,
      'streak': streak,
      'streak_rank': streakRank,
      'is_active_badge': isActiveBadge,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
