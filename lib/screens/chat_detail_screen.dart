import 'package:bookabro_proto/widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class ChatDetailScreen extends StatefulWidget {
  final UserModel peer;
  final List<ChatMessage> messages;
  const ChatDetailScreen({super.key, required this.peer, required this.messages});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final _controller = TextEditingController();
  late List<ChatMessage> msgs;
  bool isTyping = true;

  @override
  void initState() {
    super.initState();
    msgs = List.from(widget.messages);
  }

  void send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      msgs.add(ChatMessage(id: DateTime.now().toIso8601String(), fromId: currentUser.id, text: text, time: DateTime.now()));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final peer = widget.peer;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(previousPageTitle: 'Chats', middle: Text(peer.name)),
      child: SafeArea(
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: msgs.length,
              itemBuilder: (context, i) {
                final m = msgs[i];
                final isMe = m.fromId == currentUser.id;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
                    decoration: BoxDecoration(color: isMe ? const Color(0xFF007AFF) : Colors.grey[200], borderRadius: BorderRadius.circular(14)),
                    child: Text(m.text, style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
                  ),
                );
              },
            ),
          ),
          if (isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(children: [
                CircleAvatar(radius: 14, child: Text(widget.peer.name[0]), backgroundColor: Colors.blue[50]),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(18)),
                  child: Row(children: [
                    Text('${widget.peer.name.split(' ')[0]} is typing', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                    const SizedBox(width: 8),
                    const BlueTypingIndicator(),
                  ]),
                ),
              ]),
            ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(children: [
              Expanded(
                child: CupertinoTextField(
                  controller: _controller,
                  placeholder: 'Message',
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
              ),
              const SizedBox(width: 8),
              BounceButton(
                onTap: send,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: Color(0xFF007AFF), shape: BoxShape.circle),
                  child: const Icon(CupertinoIcons.arrow_up, color: Colors.white),
                ),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
