
class Message {
  String id;
  String senderId;
  String receiverId;
  String content;
  DateTime date;
  bool isRead;
  String type; // 'text', 'image', 'video'
  List<String>? attachments; // URL

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.date,
    this.isRead = false,
    this.type = 'text',
    this.attachments,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'senderId': String senderId,
        'receiverId': String receiverId,
        'content': String content,
        'date': DateTime date,
        'isRead': bool isRead,
        'type': String type,
        'attachments': List<String>? attachments,
    } =>
      Message(
          id: id,
          senderId: senderId,
          receiverId: receiverId,
          content: content,
          date: date,
          isRead: isRead,
          type: type,
          attachments: attachments,
      ),
      _ => throw const FormatException('Failed to load message.'),
    };
  }

}