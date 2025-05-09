class Profile {
  final String id;
  final String userId;
  final String name;
  final String? pictureUrl;
  final DateTime? birthdate;
  final String? location;
  final String description;
  late final String nativeLanguage;
  late final Map<String, int> learningLanguages;
  final int followers;
  final int following;
  final int streak;
  final int? streakRank;
  final bool isActiveBadge;
  final int imagesPosted;
  final int audiosPosted;
  final int audiosListened;
  final int bookmarks;
  final int appreciations;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Profile({
    required this.id,
    required this.userId,
    required this.name,
    this.pictureUrl,
    this.birthdate,
    this.location,
    required this.description,
    required this.nativeLanguage,
    required this.learningLanguages,
    this.followers = 0,
    this.following = 0,
    this.streak = 0,
    this.streakRank,
    this.isActiveBadge = false,
    this.imagesPosted = 0,
    this.audiosPosted = 0,
    this.audiosListened = 0,
    this.bookmarks = 0,
    this.appreciations = 0,
    this.createdAt,
    this.updatedAt,
  });

  Profile.languages({
    required this.nativeLanguage,
    required this.learningLanguages,
  })  : id = '',
        userId = '',
        name = '',
        description = '',
        pictureUrl = null,
        birthdate = null,
        location = null,
        followers = 0,
        following = 0,
        streak = 0,
        streakRank = null,
        isActiveBadge = false,
        imagesPosted = 0,
        audiosPosted = 0,
        audiosListened = 0,
        bookmarks = 0,
        appreciations = 0,
        createdAt = null,
        updatedAt = null;

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
      learningLanguages: Map<String, int>.from(json['learning_languages'] ?? {}),
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      streak: json['streak'] ?? 0,
      streakRank: json['streak_rank'],
      isActiveBadge: json['is_active_badge'] ?? false,
      imagesPosted: json['images_posted'] ?? 0,
      audiosPosted: json['audios_posted'] ?? 0,
      audiosListened: json['audios_listened'] ?? 0,
      bookmarks: json['bookmarks'] ?? 0,
      appreciations: json['appreciations'] ?? 0,
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
      'learning_languages': learningLanguages.entries.map((e) => '${e.key}:${e.value}').toList(),
      'followers': followers,
      'following': following,
      'streak': streak,
      'streak_rank': streakRank,
      'is_active_badge': isActiveBadge,
      'images_posted': imagesPosted,
      'audios_posted': audiosPosted,
      'audios_listened': audiosListened,
      'bookmarks': bookmarks,
      'appreciations': appreciations,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
