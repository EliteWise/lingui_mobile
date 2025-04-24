import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lingui_mobile/utils/utils.dart';

class LanguageCard extends StatelessWidget {
  final String language;
  final int level;

  const LanguageCard({super.key, required this.language, required this.level});

  String getLevelName(int value) {
    if (value >= 75) return "Fluent";
    if (value >= 50) return "Advanced";
    if (value >= 25) return "Intermediate";
    return "Beginner";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        LanguageList.getFlagAsset(language),
                        package: 'country_icons',
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        language,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: level / 100.0,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getLevelName(level),
                        style: const TextStyle(fontSize: 16),
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
