class ProfileUpdate {
  final String? name;
  final String? description;
  final String? pictureUrl;
  final DateTime? birthdate;
  final String? nativeLanguage;
  final Map<String, int>? learningLanguages;
  final Set<String>? badges;

  ProfileUpdate({
    this.name,
    this.description,
    this.pictureUrl,
    this.birthdate,
    this.nativeLanguage,
    this.learningLanguages,
    this.badges,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (name != null && name!.trim().isNotEmpty) data['name'] = name;
    if (description != null && description!.trim().isNotEmpty) data['description'] = description;
    if (pictureUrl != null && pictureUrl!.trim().isNotEmpty) data['picture_url'] = pictureUrl;

    if (birthdate != null) data['birthdate'] = birthdate!.toIso8601String();
    if (nativeLanguage != null && nativeLanguage!.trim().isNotEmpty) data['native_language'] = nativeLanguage;

    if (learningLanguages != null && learningLanguages!.isNotEmpty) {
      data['learning_languages'] = learningLanguages!.entries.map((e) => '${e.key}:${e.value}').toList();
    }

    if (badges != null && badges!.isNotEmpty) {
      data['badges'] = badges!.toList();
    }

    return data;
  }
}
