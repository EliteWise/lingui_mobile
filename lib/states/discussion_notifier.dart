import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/models/discussion.dart';

class DiscussionNotifier extends StateNotifier<List<Discussion>> {
  DiscussionNotifier() : super([]);

  void addDiscussion(Discussion newDiscussion) {
    state = [...state, newDiscussion];
  }
}

// Expose discussions
final discussionProvider = StateNotifierProvider<DiscussionNotifier, List<Discussion>>(
    (ref) => DiscussionNotifier()
);