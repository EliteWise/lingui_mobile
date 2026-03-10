import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:lingui_mobile/features/community/presentation/widgets/community_profile.dart';

void main() {
  testWidgets("Profile must contain basic infos", (tester) async {

    final testProfile = Profile(
      name: 'John Doe',
      pictureUrl: 'https://picsum.photos/600/400',
      birthdate: DateTime(1995, 5, 15),
      location: 'Paris',
      description: 'A test user',
      nativeLanguage: 'en',
      learningLanguages: {'fr': 1},
      followers: 10,
      following: 5,
      streak: 3,
      streakRank: 1,
      isActiveBadge: true,
      imagesPosted: 2,
      audiosPosted: 1,
      audiosListened: 3,
      bookmarks: 1,
      appreciations: 4,
      badges: {'early'},
      lastSeen: DateTime.now().subtract(const Duration(minutes: 2)),
    );

    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: CommunityProfile(
            profile: testProfile),
        )));

    await tester.pumpAndSettle();
    expect(find.byType(CircleAvatar), findsOneWidget);

    final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect((avatar.backgroundImage as CachedNetworkImageProvider).url, 'https://picsum.photos/600/400');

  });
}