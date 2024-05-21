import 'package:flutter/material.dart';
import 'package:lingui_mobile/utils/Utils.dart';

import '../models/discussion.dart';
import 'chat_page.dart';

class DiscussionPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DiscussionPageState();


}

class _DiscussionPageState extends State<DiscussionPage> {

  List<Discussion> discussions = [
    Discussion(id: '1', title: 'Discussion 1', participants: ["Florent"], lastMessage: 'Hello World', lastMessageTime: DateTime.now(), isRead: true, type: 'group'),
    Discussion(id: '2', title: 'Discussion 2', participants: ["Lucas"], lastMessage: 'Bonjour', lastMessageTime: DateTime.now(), isRead: false, type: 'individual'),
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
                    MaterialPageRoute(builder: (context) => ChatPage(route: '/chat', discussionId: discussions[index].id),
                    ),
                  );
                },
              );
            }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var newDiscussion = Discussion(id: '3', title: 'Discussion 3', participants: ["Lucas"], lastMessage: 'Hi', lastMessageTime: DateTime.now(), isRead: false, type: 'individual');
          handleAddDiscussion(newDiscussion);
        },
        child: Icon(Icons.add),
      ),
    );
  }

}