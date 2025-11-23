import 'package:bookabro_proto/widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import 'chat_detail_screen.dart';
import '../widgets/card_tile.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Chats', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)), SizedBox.shrink()]),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: chatList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final map = chatList[i];
                final peer = map['peer'] as UserModel;
                return PopIn(
                  index: i,
                  child: CardTile(
                    leading: CircleAvatar(child: Text(peer.name[0])),
                    title: peer.name,
                    subtitle: map['last'] as String,
                    trailing: map['time'] as String,
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (_) => ChatDetailScreen(peer: peer, messages: List.from(map['messages'] as List))));
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
