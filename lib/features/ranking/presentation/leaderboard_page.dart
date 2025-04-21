
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/common_widgets/gradient_appbar.dart';

import 'widgets/top_leaderboard_box.dart';

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
      appBar: GradientAppBar(
        title: const Row(
          children: [
            Text('Leaderboard'),
            SizedBox(width: 8),
            FaIcon(
              FontAwesomeIcons.crown,
              color: Color(0xFFFFA000), // Amber 700
              size: 23,
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {

              },
              child: const Text(
                  'Global',
                  style: TextStyle(color: Color(0xFF795548))
              )
          ),
          TextButton(
              onPressed: () {

              },
              child: const Text(
                  'Monthly',
                  style: TextStyle(color: Color(0xFF795548))
              )
          ),
        ],
      ),
      body: Column(
        children: [
           Padding(
              padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: leaderboardData.asMap().entries.map((entry) {
                int index = entry.key;
                var data = entry.value;
                return TopLeaderboardBox(
                  name: data['name'] ?? 'Unknown',
                  streak: data['streak'] ?? 0,
                  isPrimary: index == 1,
                  imageUrl: 'https://picsum.photos/150',
                  index: index + 1,
                );
              }).take(3).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: leaderboardData.length,
                itemBuilder: (context, index) {
                  final user = leaderboardData[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(((index + 3) + 1).toString(),
                          style: const TextStyle(
                            fontSize: 13
                          ),
                          ),
                          const SizedBox(width: 8),
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://picsum.photos/150'),
                            radius: 25,
                          ),
                        ],
                      ),
                      title: Text(user['name']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user['streak'].toString()),
                          const SizedBox(width: 8),
                          const FaIcon(FontAwesomeIcons.crown, color: Color(0xFFFFA000)) // Amber 700
                        ],
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      )
    );
  }
}


