import 'package:flutter/material.dart';
import 'package:lingui_mobile/views/discussion_page.dart';
import 'package:lingui_mobile/views/leaderboard_page.dart';
import 'package:lingui_mobile/views/login_page.dart';
import 'package:lingui_mobile/views/profile_page.dart';

void main() {
  runApp(const LinguiMobile());
}

class LinguiMobile extends StatelessWidget {
  const LinguiMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingui Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DiscussionPage(),
    );
  }


}