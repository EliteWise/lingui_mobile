
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/features/community/presentation/states/discussion_notifier.dart';
import 'package:lingui_mobile/features/community/presentation/widgets/language_card.dart';

import '../../chat/data/discussion.dart';
import '../../chat/application/room_service.dart';
import '../../../utils/Utils.dart';
import '../../chat/presentation/chat_page.dart';

class ProfilePage extends ConsumerStatefulWidget {

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
  final Map<String, int> learningLanguages;
  final String nativeLanguage;
  final int appreciations;
  final bool isActiveBadge;
  final int streakRank;

  const ProfilePage({
    super.key,
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
    required this.nativeLanguage,
    required this.appreciations,
    required this.isActiveBadge,
    required this.streakRank,
  });

  const ProfilePage.test({
    super.key,
    this.name = 'Test User',
    this.picture = const Image(
      image: NetworkImage('https://picsum.photos/150'),
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
      'English': 1, 'Spanish': 2,
    },
    this.nativeLanguage = "Spanish",
    this.appreciations = 200,
    this.isActiveBadge = true,
    this.streakRank = 4000,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> with SingleTickerProviderStateMixin {

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
  late Map<String, int> learningLanguages;
  late String nativeLanguage;
  late int appreciations;
  late bool isActiveBadge;
  late int streakRank;

  late AnimationController _controller;
  late Animation<double> _animation;

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
    nativeLanguage = widget.nativeLanguage;
    appreciations = widget.appreciations;
    isActiveBadge = widget.isActiveBadge;
    streakRank = widget.streakRank;

    _controller = AnimationController(
      duration: const Duration(seconds: 1, microseconds: 500),
        vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.25, end: 1.0).animate(_controller);
  }

  void enterChat() async {
    try {

      var newDiscussion = Discussion(
        id: '',
        title: 'Discussion',
        participants: ["Participant"],
        lastMessage: '?',
        lastMessageTime: DateTime.now(),
        isRead: false,
        type: 'individual',
      );

      final roomId = await createRoom(newDiscussion);
      newDiscussion.id = roomId;

      final discussions = ref.watch(discussionProvider);

      if(!discussions.any((d) => d.id == newDiscussion.id)) {
        ref.read(discussionProvider.notifier).addDiscussion(newDiscussion);
      }

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(route: 'chat', discussionId: roomId))
      );
    } catch (e) {
      print('Failed to create room: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> stats = [
      {'value': followers, 'label': 'Followers'},
      {'value': following, 'label': 'Following'},
      {'value': imagesPosted, 'label': 'Images Posted'},
    ];

    nativeLanguage = "French";

    learningLanguages = {
      "Spanish": 3,
      "German": 28,
      "Italian": 50,
    };

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(name),
            const Spacer(),
            IconButton(
                onPressed: () async {
                  enterChat();
                },
                icon: const Icon(Icons.chat, color: Color(0xFF795548)),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 5),
                      SvgPicture.asset(
                        LanguageList.getFlagAsset("French"),
                        package: 'country_icons',
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 20),
                      const Text("French"),
                      const Spacer(),
                      Text(appreciations.toString()),
                      const SizedBox(width: 10),
                      const Icon(Icons.favorite, color: Colors.redAccent)
                    ],
                  ),
                  const FaIcon(
                    FontAwesomeIcons.crown,
                    color: Color(0xFFFFA000), // Amber 700
                    size: 16,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundImage: picture.image,
                          radius: 50,
                        ),
                        const SizedBox(height: 8),
                        Text(streak.toString()),
                      ],
                    )
                  ),
                  const SizedBox(height: 10),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _animation.value,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF795548), // Button color
                            ),
                            onPressed: () {

                            },
                            child: const Text('Confirm Streak', style: TextStyle(color: Colors.white)),
                          )
                        );
                      }),
                ]
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
              const SizedBox(height: 16),
              const Center(
                child: Text("Learning Languages",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black26,
                          offset: Offset(1.0, 1.0),
                        ),
                      ],
                    )),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  ...learningLanguages.entries.map((entry) {
                    return LanguageCard(language: entry.key, level: entry.value);
                  }),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF795548),
        // TODO: add chat creation modal with contacts list to add new chat with new participants
        onPressed: () async {
          enterChat();
        },
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }
}
