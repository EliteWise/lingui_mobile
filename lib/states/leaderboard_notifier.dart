import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaderboardNotifier = StateNotifierProvider<LeaderboardNotifier, String>((ref) {
  return LeaderboardNotifier();
});

class LeaderboardNotifier extends StateNotifier<String> {
  LeaderboardNotifier() : super('Global');

  void setView(String view) {
    state = view;
  }
}