import 'package:appwrite/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/features/auth/application/states/auth_provider.dart';
import 'package:lingui_mobile/features/community/data/profile_extensions.dart';

import '../../../../utils/utils.dart' as utils;
import '../../data/profile.dart';
import '../../data/user.dart' as appUser;
import '../profile_page.dart';

class CommunityProfile extends ConsumerWidget {

  final Profile profile;

  const CommunityProfile({
    required this.profile,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    User? user = userAsync.maybeWhen(
      data: (user) => user as User?,
      orElse: () => null,
    );

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(profile: profile)));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: CachedNetworkImageProvider(profile.displayPictureUrl),
                ),
                if (profile.isNewUser(user as User))
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'New',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: -6,
                  right: 30,
                  child: Icon(
                    Icons.circle,
                    color: profile.isConnected ? Colors.greenAccent : Colors.redAccent,
                    size: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        profile.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        profile.displayAge.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Spacer(),
                      if(profile.isActiveBadge)
                        const FaIcon(
                            FontAwesomeIcons.crown,
                            color: Color(0xFFFFA000), // Amber 700
                            size: 16.0)
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(profile.displayDescription),
                  Text(''),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Native: '),
                          SvgPicture.asset(
                            utils.LanguageList.getFlagAsset(profile.nativeLanguage),
                            package: 'country_icons',
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 8),
                          const Text('Learn: '),
                          SvgPicture.asset(
                            utils.LanguageList.getFlagAsset(profile.displayLearningLanguages.keys.first),
                            package: 'country_icons',
                            width: 12,
                            height: 12,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: profile.badges.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.grey[400]!, width: 0.5),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black87,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
