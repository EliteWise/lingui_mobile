import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:async';

class MessagingRequest {

  Timer? _reconnectTimer;
  late WebSocketChannel channel;
  void Function(String message)? onMessageReceived;
  final String route;
  final String roomId;

  MessagingRequest({required this.route, required this.roomId}) {
    _connectWebSocket();
  }

  void _connectWebSocket() {
    final uri = Uri.parse('ws://10.0.2.2:8080/$route?roomId=$roomId');
    channel = WebSocketChannel.connect(
        uri
    );

    print('Connecting to $uri');

    channel.stream.listen(
          (message) {
            if (onMessageReceived != null) {
              onMessageReceived!(message);
            }
        // Handle incoming messages
        print('Received message: $message');
      },
      onError: (error) {
        print('WebSocket error: $error');
        //_scheduleReconnect();
      },
      onDone: () {
        print('WebSocket connection closed');
        //_scheduleReconnect();
      },
    );
  }

  void _scheduleReconnect() {
    if (_reconnectTimer != null) {
      return;
    }
    _reconnectTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      print('Attempting to reconnect...');
      _connectWebSocket();
    });
  }

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      try {
        channel.sink.add(message);
      } catch (error) {
        print('Error sending message: $error');
      }
    }
  }

  void dispose() {
    channel.sink.close();
    _reconnectTimer?.cancel();
  }

}