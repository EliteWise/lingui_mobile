import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifier = StateNotifierProvider<AuthNotifier, String>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<String> {
  AuthNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}