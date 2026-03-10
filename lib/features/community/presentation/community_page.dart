import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/common_widgets/gradient_appbar.dart';
import 'package:lingui_mobile/features/auth/application/states/auth_provider.dart';
import 'package:lingui_mobile/features/community/application/states/community_provider.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:lingui_mobile/features/community/presentation/states/discussion_notifier.dart';
import 'package:lingui_mobile/utils/calculations.dart';

import 'widgets/community_profile.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {

  late List<Profile> profiles;

  @override
  Widget build(BuildContext context) {
    final community = ref.watch(communityProvider);
    final user = ref.watch(userProvider);

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
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                final profile = profiles[index];
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    RepaintBoundary(
                      key: ValueKey(profile),
                      child: CommunityProfile(profile: profile),
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
