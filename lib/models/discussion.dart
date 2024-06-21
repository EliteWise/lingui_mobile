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

  factory Discussion.fromJson(Map<String, dynamic> json) {
    return Discussion(
      id: json['id'],
      title: json['title'],
      participants: List<String>.from(json['participants']),
      lastMessage: json['lastMessage'],
      lastMessageTime: DateTime.parse(json['lastMessageTime']),
      isRead: json['isRead'],
      type: json['type'],
      imageUrl: json.containsKey('imageUrl') ? json['imageUrl'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    final data = {
      'id': id,
      'title': title,
      'participants': participants,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'isRead': isRead,
      'type': type,
      'imageUrl': imageUrl,
    };
    if (imageUrl != null) {
      data['imageUrl'] = imageUrl;
    }
    return data;
  }

}