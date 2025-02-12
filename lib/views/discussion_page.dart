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

  // TODO: Consider using state management package like Provider or Riverpod

  List discussions = [];

  void handleAddDiscussion(Discussion newDiscussion) {
    setState(() {
      discussions.add(newDiscussion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discussions'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: SearchBar(
            hintText: 'Search...',
            elevation: WidgetStateProperty.all(0.5),
            shape: WidgetStateProperty.all(
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
                const SizedBox(
                  width: 300,
                  child: Divider()
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // TODO: add chat creation modal with contacts list to add new chat with new participants
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
        child: const Icon(Icons.add),
      ),
    );
  }

}