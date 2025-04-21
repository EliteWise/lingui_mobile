import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingui_mobile/common_widgets/navigation.dart';

void main() {
  testWidgets('Navigation widget has 4 clickable icons', (tester) async {

    await tester.pumpWidget(const MaterialApp(
      home: Navigation()
    ));

    final bottomNavBarFinder = find.byType(BottomNavigationBar);
    expect(bottomNavBarFinder, findsOneWidget);

    final bottomNavBar = tester.widget<BottomNavigationBar>(bottomNavBarFinder);
    expect(bottomNavBar.items.length, 4);

    final communityIcon = find.byIcon(Icons.people_outline);
    final discussionIcon = find.byIcon(Icons.mark_unread_chat_alt_outlined);
    final imageIcon = find.byIcon(Icons.image_outlined);
    final leaderboardIcon = find.byIcon(Icons.leaderboard_outlined);
    
    expect(communityIcon, findsOneWidget);
    expect(discussionIcon, findsOneWidget);
    expect(imageIcon, findsOneWidget);
    expect(leaderboardIcon, findsOneWidget);
  });
}