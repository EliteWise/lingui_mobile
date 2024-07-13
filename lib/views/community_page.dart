import 'dart:math';

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text("Community"),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(height: 12),
                CommunityProfile(
                  imageUrl: 'https://via.placeholder.com/600x400.png?text=Image+' + index.toString(),
                  name: 'Name',
                  age: 26,
                  nativeLanguage: 'French',
                  learningLanguage: 'Spanish',
                  description: "Description de profil",
                  tags: ["Learn", "Friendship"],
                  isActive: Random().nextBool(),
                  isNewUser: Random().nextBool(),
                  isConnected: Random().nextBool(),
                )

              ],
            );
          },
      ),
    );
  }
}
