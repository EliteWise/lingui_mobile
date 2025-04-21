import 'package:flutter/material.dart';
import 'package:lingui_mobile/features/community/presentation/community_page.dart';
import 'package:lingui_mobile/features/share_images/presentation/country_folder_page.dart';
import 'package:lingui_mobile/features/ranking/presentation/leaderboard_page.dart';

import '../features/chat/presentation/discussion_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<Navigation> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  static const List<Widget> _navigablePages = <Widget>[
    CommunityPage(),
    DiscussionPage(),
    CountryFolderPage(),
    LeaderboardPage(),
  ];

  _onPageChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navigablePages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: 'Community'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.mark_unread_chat_alt_outlined),
              label: 'Discussion'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Images'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined),
              label: 'Leaderboard'
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFFFA000), // Amber 700
        unselectedItemColor: const Color(0xFF795548),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onPageChange,
      ),
    );
  }
}
