import 'package:flutter/material.dart';
import '../services/room_service.dart';

import '../models/discussion.dart';
import 'chat_page.dart';

class DiscussionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DiscussionPageState();


}

class _DiscussionPageState extends State<DiscussionPage> {

  List<Discussion> discussions = [];

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
      ),
      body: Container(
        child: ListView.builder(
            itemCount: discussions.length ,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.message),
                title: Text(discussions[index].title),
                subtitle: Text(discussions[index].lastMessage),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage(route: 'chat', discussionId: discussions[index].id),
                    ),
                  );
                },
              );
            }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          try {

            var newDiscussion = Discussion(
              id: '',
              title: 'Discussion',
              participants: ["Participant"],
              lastMessage: '',
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