import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../services/room_service.dart';

import '../models/discussion.dart';
import 'chat_page.dart';

class DiscussionPage extends StatefulWidget {
  const DiscussionPage({super.key});


  @override
  State<StatefulWidget> createState() => _DiscussionPageState();


}

class _DiscussionPageState extends State<DiscussionPage> {

  List<Discussion> discussions = [
    Discussion(
      id: '1',
      title: 'Discussion 1',
      participants: ['Alice', 'Bob'],
      lastMessage: 'Salut Bob, comment ça va?',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 10)),
      isRead: true,
      type: 'individual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '2',
      title: 'Groupe Projet',
      participants: ['Alice', 'Bob', 'Charlie'],
      lastMessage: 'Prochaine réunion demain à 15h.',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 20)),
      isRead: false,
      type: 'group',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '3',
      title: 'Discussion 3',
      participants: ['Alice', 'Dave'],
      lastMessage: 'Tu as fini le rapport?',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 30)),
      isRead: true,
      type: 'individual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '4',
      title: 'Groupe Famille',
      participants: ['Alice', 'Maman', 'Papa', 'Soeur'],
      lastMessage: 'Dîner de famille dimanche.',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 40)),
      isRead: true,
      type: 'group',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '5',
      title: 'Discussion 5',
      participants: ['Alice', 'Eve'],
      lastMessage: 'On se voit ce weekend?',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 50)),
      isRead: false,
      type: 'individual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '6',
      title: 'Groupe Amis',
      participants: ['Alice', 'Bob', 'Charlie', 'Dave'],
      lastMessage: 'Qui est partant pour un ciné?',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 60)),
      isRead: true,
      type: 'group',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '7',
      title: 'Discussion 7',
      participants: ['Alice', 'Frank'],
      lastMessage: 'N’oublie pas notre rendez-vous.',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 70)),
      isRead: true,
      type: 'individual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '8',
      title: 'Groupe Travail',
      participants: ['Alice', 'Bob', 'Charlie', 'Dave', 'Eve'],
      lastMessage: 'Rapport à rendre avant lundi.',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 80)),
      isRead: false,
      type: 'group',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '9',
      title: 'Discussion 9',
      participants: ['Alice', 'Grace'],
      lastMessage: 'Bon anniversaire !',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 90)),
      isRead: true,
      type: 'individual',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Discussion(
      id: '10',
      title: 'Groupe Sport',
      participants: ['Alice', 'Bob', 'Charlie', 'Eve'],
      lastMessage: 'Entraînement annulé.',
      lastMessageTime: DateTime.now().subtract(Duration(minutes: 100)),
      isRead: true,
      type: 'group',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  // TODO: Consider using state management package like Provider or Riverpod

  void handleAddDiscussion(Discussion newDiscussion) {
    setState(() {
      discussions.add(newDiscussion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discussions'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: SearchBar(
            hintText: 'Search...',
            elevation: MaterialStateProperty.all(0.5),
            shape: MaterialStateProperty.all(
              LinearBorder.none
            ),
            trailing: [
              Tooltip(
                message: "Users connected",
                child: IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.circle, color: Colors.lightGreen),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: const Icon(Icons.spellcheck, color: Colors.black))
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: discussions.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                         discussions[index].imageUrl ?? '',
                      )
                  ),
                  title: Text(discussions[index].title),
                  subtitle: Text(discussions[index].lastMessage),
                  trailing: Text(
                    '${discussions[index].lastMessageTime.hour}:${discussions[index].lastMessageTime.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(color: discussions[index].isRead ? Colors.grey : Colors.amber),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(
                            route: 'chat',
                            discussionId: discussions[index].id
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: 300, // Spécifiez la largeur souhaitée ici
                  child: Divider()
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

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

            handleAddDiscussion(newDiscussion);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage(route: 'chat', discussionId: roomId))
            );
          } catch (e) {
            print('Failed to create room: $e');
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

}