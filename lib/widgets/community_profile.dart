import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/Utils.dart';

class CommunityProfile extends StatelessWidget {

  final String imageUrl;
  final String name;
  final int age;
  final String nativeLanguage;
  final String learningLanguage;
  final String description;
  final List<String> tags;
  final bool isNewUser;
  final bool isActive;
  final bool isConnected;

  const CommunityProfile({
    required this.imageUrl,
    required this.name,
    required this.age,
    required this.nativeLanguage,
    required this.learningLanguage,
    required this.description,
    required this.tags,
    required this.isNewUser,
    required this.isActive,
    required this.isConnected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
              if (isNewUser)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
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
                    color: isConnected ? Colors.greenAccent : Colors.redAccent,
                    size: 14,
                  ),
                ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      age.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Spacer(),
                    if(isActive)
                    FaIcon(
                        FontAwesomeIcons.crown,
                        color: Colors.amber,
                        size: 16.0)
                  ],
                ),
                SizedBox(height: 4),
                Text(description),
                Text(description),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text('Native: '),
                    SvgPicture.asset(
                      getFlagAsset(nativeLanguage),
                      package: 'country_icons',
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: 8),
                    Text('Learn: '),
                    SvgPicture.asset(
                      getFlagAsset(learningLanguage),
                      package: 'country_icons',
                      width: 12,
                      height: 12,
                    ),
                    SizedBox(width: 16),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: tags.map((tag) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0), // Marges internes réduites
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.grey[400]!, width: 0.5),
                            borderRadius: BorderRadius.circular(16.0), // Bordures arrondies
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontSize: 12.0, // Taille de police ajustée
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
