import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatNotifier = StateNotifierProvider<ChatNotifier, String>((ref) {
  return ChatNotifier();
});

class ChatNotifier extends StateNotifier<String> {
  ChatNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}