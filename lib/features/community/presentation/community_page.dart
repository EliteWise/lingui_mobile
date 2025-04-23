import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lingui_mobile/common_widgets/gradient_appbar.dart';

import 'widgets/community_profile.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {

  late List<Map<String, dynamic>> profiles;

  @override
  void initState() {
    super.initState();
    profiles = List.generate(10, (_) => {
      'isActive': Random().nextBool(),
      'isNewUser': Random().nextBool(),
      'isConnected': Random().nextBool(),
    });
  }

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
          final profile = profiles[index];
          return Column(
            children: [
              const SizedBox(height: 12),
              RepaintBoundary(
                key: ValueKey(profile),
                child: CommunityProfile(
                  imageUrl: 'https://picsum.photos/600/400',
                  name: 'Name',
                  age: 26,
                  nativeLanguage: 'French',
                  learningLanguage: 'Spanish',
                  description: "Description de profil",
                  tags: const ["Learn", "Friendship"],
                  isActive: profile['isActive'],
                  isNewUser: profile['isNewUser'],
                  isConnected: profile['isConnected'],
                ),
              )
            ],
          );
        },
      )
    );
  }
}
