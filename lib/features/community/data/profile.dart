class Profile {
  final String name;
  final String? pictureUrl;
  final DateTime? birthdate;
  final String? location;
  final String? description;
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
  final Set<String> badges;
  final DateTime? lastSeen;

  Profile({
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
    this.badges = const {},
    this.lastSeen,
  });

  Profile.languages({
    required this.nativeLanguage,
    required this.learningLanguages,
  })  :
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
        badges = const {},
        lastSeen = null;

  Profile.info({
    this.pictureUrl,
    required this.birthdate,
    required this.badges,
  })  :
        name = '',
        description = '',
        nativeLanguage = '',
        learningLanguages = {},
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
        lastSeen = null;

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      pictureUrl: json['picture_url'] ?? '',
      birthdate: json['birthdate'] != null ? DateTime.parse(json['birthdate']) : null,
      location: json['location'] ?? '',
      description: json['description'] ?? '',
      nativeLanguage: json['native_language'] ?? '',
      learningLanguages: Map<String, int>.fromEntries(
        (json['learning_languages'] as List<dynamic>?)
            ?.map((e) {
          final parts = (e as String).split(':');
          return MapEntry(parts[0], int.tryParse(parts[1]) ?? 0);
        }) ?? [],
      ),
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
      badges: Set<String>.from(json['badges'] ?? []),
      lastSeen: json['last_seen'] != null ? DateTime.parse(json['last_seen']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'picture_url': pictureUrl,
      'birthdate': birthdate?.toUtc().toIso8601String(),
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
      'badges': badges.toList(),
      'last_seen': lastSeen?.toIso8601String(),
    };
  }
}
