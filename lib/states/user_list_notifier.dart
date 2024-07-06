import 'package:flutter_riverpod/flutter_riverpod.dart';

final userListNotifier = StateNotifierProvider<UserListNotifier, String>((ref) {
  return UserListNotifier();
});

class UserListNotifier extends StateNotifier<String> {
  UserListNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}