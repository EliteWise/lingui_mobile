import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopLeaderboardBox extends StatelessWidget {

  final String name;
  final int streak;
  final bool isPrimary;
  final String imageUrl;
  final int index;

  const TopLeaderboardBox({
    super.key,
    required this.name,
    required this.streak,
    this.isPrimary = false,
    this.imageUrl = 'https://via.placeholder.com/150',
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    String displayIndex;
    if (isPrimary) {
      displayIndex = '1';
    } else if (index == 1) {
      displayIndex = '2';
    } else {
      displayIndex = '3';
    }

    return Column(
      children: [
        Text(displayIndex,
        style: const TextStyle(
         fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrangeAccent,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black45,
              offset: Offset(2.0, 2.0),
            ),
          ],
        )),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: isPrimary ? Border.all(color: Colors.amber, width: 1.5) : null,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(-5, 5),
              ),
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
                radius: isPrimary ? 35 : 25,
              ),
              const SizedBox(height: 8),
              Text(
                name,
                style: TextStyle(
                  fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
                  fontSize: isPrimary ? 18 : 16,
                ),
              ),
              Text(
                '$streak',
                style: TextStyle(fontSize: isPrimary ? 16 : 14),
              ),
            ],
          ),
        ),
        if (isPrimary)
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: const FaIcon(
              FontAwesomeIcons.medal,
              color: Colors.amber,
              size: 23,
            ),
          )
      ],
    );
  }
}