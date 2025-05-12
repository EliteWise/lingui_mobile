import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/common_widgets/gradient_appbar.dart';
import 'package:lingui_mobile/features/community/application/states/community_provider.dart';
import 'package:lingui_mobile/features/community/presentation/states/discussion_notifier.dart';

import 'widgets/community_profile.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {

  late List<Map<String, dynamic>> profiles;

  @override
  Widget build(BuildContext context) {
    final community = ref.read(communityProvider);

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
      body: community.when(
          data: (profiles) {
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final community = ref.read(communityServiceProvider);
                community.fetchCommunity();
                final profile = profiles[index];
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    RepaintBoundary(
                      key: ValueKey(profile),
                      child: CommunityProfile(
                        imageUrl: profile.pictureUrl,
                        name: profile.name,
                        age: profile.birthdate,
                        nativeLanguage: profile.nativeLanguage,
                        learningLanguage: profile.learningLanguages.entries.first.key,
                        description: profile.description,
                        tags: profile.badges.toList() ?? [],
                        isActive: profile.isActiveBadge,
                        isNewUser: null,
                        isConnected: null,
                      ),
                    )
                  ],
                );
              },
            );
          },
          error: (e, stackTrace) {
            return Center(child: Text(e.toString()));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          }
      )
    );
  }
}
