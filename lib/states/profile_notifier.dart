import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileNotifier = StateNotifierProvider<ProfileNotifier, String>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<String> {
  ProfileNotifier() : super('');

  void setView(String view) {
    state = view;
  }
}