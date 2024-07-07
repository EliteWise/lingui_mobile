import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopLeaderboardBox extends StatelessWidget {

  final String name;
  final int streak;
  final bool isPrimary;
  final String imageUrl;

  const TopLeaderboardBox({
    Key? key,
    required this.name,
    required this.streak,
    this.isPrimary = false,
    this.imageUrl = 'https://via.placeholder.com/150',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isPrimary ? Colors.amber : Colors.grey[300],
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
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                radius: isPrimary ? 35 : 25,
              ),
              SizedBox(height: 8),
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