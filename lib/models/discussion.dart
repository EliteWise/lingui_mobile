class Discussion {
  String id;
  String title;
  List<String> participants;
  String lastMessage;
  DateTime lastMessageTime;
  bool isRead;
  String type; // 'individual' or 'group'
  String? imageUrl;

  Discussion({
    required this.id,
    required this.title,
    required this.participants,
    required this.lastMessage,
    required this.lastMessageTime,
    this.isRead = false,
    this.type = 'individual',
    this.imageUrl,
  });

}