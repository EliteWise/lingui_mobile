import 'package:flutter/material.dart';
import 'package:lingui_mobile/views/community_page.dart';
import 'package:lingui_mobile/views/country_folder_page.dart';
import 'package:lingui_mobile/views/discussion_page.dart';
import 'package:lingui_mobile/views/leaderboard_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

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
        selectedItemColor: Colors.amber[600],
        unselectedItemColor: Colors.blueGrey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onPageChange,
      ),
    );
  }
}
