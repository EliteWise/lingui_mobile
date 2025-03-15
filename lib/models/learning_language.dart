class LearningLanguage {
  final String id;
  final String profileId;
  final String language;
  final int? proficiencyLevel;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LearningLanguage({
    required this.id,
    required this.profileId,
    required this.language,
    this.proficiencyLevel,
    this.createdAt,
    this.updatedAt,
  });

  factory LearningLanguage.fromJson(Map<String, dynamic> json) {
    return LearningLanguage(
      id: json['id'],
      profileId: json['profile_id'],
      language: json['language'],
      proficiencyLevel: json['proficiency_level'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_id': profileId,
      'language': language,
      'proficiency_level': proficiencyLevel,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
