import 'dart:ui';

import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> leaderboardData = [
      {'name': 'AAAAAA', 'streak': 1500},
      {'name': 'BBBBBB', 'streak': 1400},
      {'name': 'CCCCCC', 'streak': 1300},
      {'name': 'DDDDDD', 'streak': 1200},
      {'name': 'EEEEEE', 'streak': 1100},
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
          itemCount: leaderboardData.length,
          itemBuilder: (context, index) {
            final user = leaderboardData[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  radius: 25,
                ),
                title: Text(user['name']),
                trailing: Text(user['streak'].toString()),
              ),
            );
          }
      ),
    );
  }
}
