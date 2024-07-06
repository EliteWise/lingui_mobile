import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationNotifier = StateNotifierProvider<NotificationNotifier, String>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends StateNotifier<String> {
  NotificationNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}