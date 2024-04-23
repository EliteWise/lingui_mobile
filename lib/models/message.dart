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

}