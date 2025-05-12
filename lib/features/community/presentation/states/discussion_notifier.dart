import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/chat/data/discussion.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';

import '../../application/states/community_provider.dart';

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

final communityProvider = FutureProvider<List<Profile>>((ref) async {
  final communityService = ref.read(communityServiceProvider);
  return communityService.fetchCommunity();
});