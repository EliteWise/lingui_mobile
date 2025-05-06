
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/features/chat/application/states/chat_provider.dart';
import 'package:lingui_mobile/features/community/presentation/states/discussion_notifier.dart';
import 'package:lingui_mobile/features/community/presentation/widgets/language_card.dart';

import '../../chat/data/discussion.dart';
import '../../chat/application/room_service.dart';
import '../../../utils/utils.dart';
import '../../chat/presentation/chat_page.dart';
import '../data/profile.dart';

class ProfilePage extends ConsumerStatefulWidget {

  final Profile profile;

  const ProfilePage({
    super.key,
    required this.profile,
  });

  ProfilePage.test({super.key}) : profile = Profile(
    id: 'test_id',
    userId: 'test_user',
    name: 'Test User',
    pictureUrl: 'https://picsum.photos/150',
    birthdate: DateTime(1990, 1, 1),
    location: 'Miami, USA',
    description: 'This is a test description.',
    nativeLanguage: 'Spanish',
    learningLanguages: {
      'English': 1,
      'Spanish': 2,
    },
    followers: 100,
    following: 50,
    streak: 7,
    streakRank: 4000,
    isActiveBadge: true,
    imagesPosted: 10,
    audiosPosted: 5,
    audiosListened: 20,
    bookmarks: 15,
    appreciations: 200,
    createdAt: null,
    updatedAt: null
  );

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1, microseconds: 500),
        vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.25, end: 1.0).animate(_controller);
  }

  void enterChat() async {
    try {

      var newDiscussion = Discussion(
        title: 'Discussion',
        participants: ["Participant"],
        lastMessage: '?',
        lastMessageTime: DateTime.now(),
        isRead: false,
        type: 'individual',
      );

      final roomId = await ref.read(roomProvider).createRoom(newDiscussion);
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
      {'value': widget.profile.followers, 'label': 'Followers'},
      {'value': widget.profile.following, 'label': 'Following'},
      {'value': widget.profile.imagesPosted, 'label': 'Images Posted'},
    ];

    widget.profile.nativeLanguage = "French";

    widget.profile.learningLanguages = {
      "Spanish": 3,
      "German": 28,
      "Italian": 50,
    };

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.profile.name),
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
                      Text(widget.profile.appreciations.toString()),
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
                          backgroundImage: widget.profile.pictureUrl != null ?
                          NetworkImage(widget.profile.pictureUrl!) : const AssetImage('assets/images/globe-icon.png') as ImageProvider,
                          radius: 50,
                        ),
                        const SizedBox(height: 8),
                        Text(widget.profile.streak.toString()),
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
              Text(widget.profile.description),
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
                  ...widget.profile.learningLanguages.entries.map((entry) {
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
