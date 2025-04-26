import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingui_mobile/features/community/presentation/widgets/community_profile.dart';

void main() {
  testWidgets("Profile must contain basic infos", (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: CommunityProfile(
      imageUrl: 'https://picsum.photos/600/400',
      name: 'Name Space',
      age: 26,
      nativeLanguage: 'French',
      learningLanguage: 'Spanish',
      description: "Description de profil....",
      tags: const ["Learn", "Friendship"],
      isActive: Random().nextBool(),
      isNewUser: Random().nextBool(),
      isConnected: Random().nextBool(),
    ))));

    await tester.pumpAndSettle();
    expect(find.byType(CircleAvatar), findsOneWidget);

    final avatar = tester.widget<CircleAvatar>(find.byType(CircleAvatar));
    expect((avatar.backgroundImage as CachedNetworkImageProvider).url, 'https://picsum.photos/600/400');

  });
}