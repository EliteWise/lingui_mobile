import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {

  final String name;
  final Image picture;
  final int followers;
  final int following;
  final String birthdate;
  final String location;
  final String description;
  final int imagesPosted;
  final int audiosPosted;
  final int audiosListened;
  final int bookmarks;
  final int streak;
  final Map<List<String>, List<int>> learningLanguages;
  final Map<List<String>, List<int>> nativeLanguages;
  final int appreciations;
  final bool isActiveBadge;
  final int streakRank;

  ProfilePage({
    Key? key,
    required this.name,
    required this.picture,
    required this.followers,
    required this.following,
    required this.birthdate,
    required this.location,
    required this.description,
    required this.imagesPosted,
    required this.audiosPosted,
    required this.audiosListened,
    required this.bookmarks,
    required this.streak,
    required this.learningLanguages,
    required this.nativeLanguages,
    required this.appreciations,
    required this.isActiveBadge,
    required this.streakRank,
  }) : super(key: key);

  ProfilePage.test({
    Key? key,
    this.name = 'Test User',
    this.picture = const Image(
      image: NetworkImage('https://via.placeholder.com/150'),
    ),
    this.followers = 100,
    this.following = 50,
    this.birthdate = '01-01-1990',
    this.location = 'Miami, USA',
    this.description = 'This is a test description.',
    this.imagesPosted = 10,
    this.audiosPosted = 5,
    this.audiosListened = 20,
    this.bookmarks = 15,
    this.streak = 7,
    this.learningLanguages = const {
      ['English', 'Spanish']: [3, 4],
    },
    this.nativeLanguages = const {
      ['French']: [5],
    },
    this.appreciations = 200,
    this.isActiveBadge = true,
    this.streakRank = 4000,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late String name;
  late Image picture;
  late int followers;
  late int following;
  late String birthdate;
  late String location;
  late String description;
  late int imagesPosted;
  late int audiosPosted;
  late int audiosListened;
  late int bookmarks;
  late int streak;
  late Map<List<String>, List<int>> learningLanguages;
  late Map<List<String>, List<int>> nativeLanguages;
  late int appreciations;
  late bool isActiveBadge;
  late int streakRank;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    picture = widget.picture;
    followers = widget.followers;
    following = widget.following;
    birthdate = widget.birthdate;
    location = widget.location;
    description = widget.description;
    imagesPosted = widget.imagesPosted;
    audiosPosted = widget.audiosPosted;
    audiosListened = widget.audiosListened;
    bookmarks = widget.bookmarks;
    streak = widget.streak;
    learningLanguages = widget.learningLanguages;
    nativeLanguages = widget.nativeLanguages;
    appreciations = widget.appreciations;
    isActiveBadge = widget.isActiveBadge;
    streakRank = widget.streakRank;
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> stats = [
      {'value': followers, 'label': 'Followers'},
      {'value': following, 'label': 'Following'},
      {'value': imagesPosted, 'label': 'Images Posted'},
      {'value': streakRank, 'label': 'Streak Rank'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(name),
            const SizedBox(width: 8),
            if (isActiveBadge) const Icon(Icons.badge, color: Colors.green),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: picture.image,
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Text(description),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: stats.map((stat) {
                  return Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(stat['value'].toString()),
                        Text(stat['label'])
                      ],
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
