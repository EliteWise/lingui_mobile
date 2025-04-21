class NotificationModel {
  final String id;
  final String userId;
  final String? type;
  final Map<String, dynamic>? content;
  final bool isRead;
  final DateTime? createdAt;

  NotificationModel({
    required this.id,
    required this.userId,
    this.type,
    this.content,
    this.isRead = false,
    this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      type: json['type'],
      content: json['content'],
      isRead: json['is_read'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'content': content,
      'is_read': isRead,
      'created_at': createdAt?.toIso8601String(),
    };
  }
}
