import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/room_service.dart';

import '../models/discussion.dart';
import '../states/discussion_notifier.dart';
import 'chat_page.dart';

class DiscussionPage extends ConsumerStatefulWidget {
  const DiscussionPage({super.key});


  @override
  ConsumerState<DiscussionPage> createState() => _DiscussionPageState();


}

class _DiscussionPageState extends ConsumerState<DiscussionPage> {

  // TODO: Consider using state management package like Provider or Riverpod

  @override
  Widget build(BuildContext context) {
    final discussions = ref.watch(discussionProvider);
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
    );
  }

}