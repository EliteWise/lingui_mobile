import 'package:flutter/material.dart';
import 'package:lingui_mobile/services/MessagingRequest.dart';

class ChatPage extends StatefulWidget {
  final String route;
  final String discussionId;

  const ChatPage({super.key, required this.route, required this.discussionId});

  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();
  late MessagingRequest _messagingRequest;

  @override
  void initState() {
    super.initState();
    _messagingRequest = MessagingRequest(route: widget.route, roomId: widget.discussionId);
    _messagingRequest.onMessageReceived = (message) {
      setState(() {
        _messages.add(message);
      });
    };
  }

  void _sendMessage() {
    if(_controller.text.isNotEmpty) {
      _messagingRequest.sendMessage(_controller.text);
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _messagingRequest.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_messages[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
  
  
}