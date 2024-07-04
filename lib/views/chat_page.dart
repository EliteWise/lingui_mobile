import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/services/MessagingRequest.dart';
import 'package:lingui_mobile/themes/chat_theme.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatPage extends StatefulWidget {
  final String route;
  final String discussionId;

  const ChatPage({super.key, required this.route, required this.discussionId});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac', firstName: "Elite", lastName: "Elite", imageUrl: "https://via.placeholder.com/150");
  final TextEditingController _controller = TextEditingController();
  late MessagingRequest _messagingRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFFFECB3),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_user.firstName ?? "",
              style: TextStyle(
                  color: Color(0xFF795548)
              ),
                overflow: TextOverflow.ellipsis,
            ),
            const Text("En ligne",
            style: TextStyle(
              fontSize: 12
            ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                icon: const Icon(Icons.settings, color: Color(0xFF795548),),
                onPressed: () {  },
              ),
          )
        ],
      ),
      body: Chat(
          messages: _messages,
          onSendPressed: _handleSendPressed,
          user: _user,
          showUserAvatars: true,
          showUserNames: true,
          theme: const LinguiChatTheme(),
          onAttachmentPressed: _handleImageSelection,
          avatarBuilder: (user) {
            return CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                user.imageUrl ?? '',
              ),
            );
          },
      ),
    );
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: randomString(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }
  
}