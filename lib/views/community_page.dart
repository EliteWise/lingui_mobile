import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lingui_mobile/widgets/gradient_appbar.dart';

import '../widgets/community_profile.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
          title: const Text('Community'),
        actions: [
          IconButton(
          icon: Image.asset(
          "assets/images/globe-icon.png",
          ),
            onPressed: () {
              print('globe');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: 12),
              CommunityProfile(
                imageUrl: 'https://picsum.photos/600/400',
                name: 'Name',
                age: 26,
                nativeLanguage: 'French',
                learningLanguage: 'Spanish',
                description: "Description de profil",
                tags: const ["Learn", "Friendship"],
                isActive: Random().nextBool(),
                isNewUser: Random().nextBool(),
                isConnected: Random().nextBool(),
              )

            ],
          );
        },
      )
    );
  }
}
