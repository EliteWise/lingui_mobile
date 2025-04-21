class Appreciation {
  final String id;
  final String giverId;
  final String receiverId;
  final String contentType;
  final String contentId;
  final DateTime? createdAt;

  Appreciation({
    required this.id,
    required this.giverId,
    required this.receiverId,
    required this.contentType,
    required this.contentId,
    this.createdAt,
  });

  factory Appreciation.fromJson(Map<String, dynamic> json) {
    return Appreciation(
      id: json['id'],
      giverId: json['giver_id'],
      receiverId: json['receiver_id'],
      contentType: json['content_type'],
      contentId: json['content_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'giver_id': giverId,
      'receiver_id': receiverId,
      'content_type': contentType,
      'content_id': contentId,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
