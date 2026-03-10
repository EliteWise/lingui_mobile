import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/chat/application/drift_service.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';

import '../../application/states/community_provider.dart';

class DiscussionNotifier extends Notifier<List<Discussion>> {
  @override
  List<Discussion> build() => [];

  void addDiscussion(Discussion newDiscussion) {
    state = [...state, newDiscussion];
  }
}

final discussionProvider = NotifierProvider<DiscussionNotifier, List<Discussion>>(
  DiscussionNotifier.new,
);

final communityProvider = FutureProvider<List<Profile>>((ref) async {
  final communityService = ref.read(communityServiceProvider);
  return communityService.fetchCommunity();
});