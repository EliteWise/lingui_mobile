
import 'package:isar/isar.dart';

part 'message.g.dart';

@collection
class Message {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String senderId;

  @Index(type: IndexType.value)
  String receiverId;

  String content;
  DateTime date;
  bool isRead;
  String type; // 'text', 'image', 'video'
  List<String>? attachments; // URL

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.date,
    this.isRead = false,
    this.type = 'text',
    this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      isRead: json['isRead'] ?? false,
      type: json['type'] ?? 'text',
      attachments: json['attachments'] != null
          ? List<String>.from(json['attachments'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'date': date.toIso8601String(),
      'isRead': isRead,
      'type': type,
      'attachments': attachments,
    };
    return data;
  }

}