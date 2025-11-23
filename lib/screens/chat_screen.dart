// lib/screens/chat_screen.dart
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final Map<String, dynamic> other;
  const ChatScreen({super.key, required this.chatId, required this.other});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _ctrl = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hey what's up?", "isMe": false, "time": "2:21 PM"},
    {"text": "All good bro!", "isMe": true, "time": "2:22 PM"},
  ];

  void _send() {
    final t = _ctrl.text.trim();
    if (t.isEmpty) return;
    setState(() {
      _messages.add({"text": t, "isMe": true, "time": "Now"});
      _ctrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final other = widget.other;
    return Scaffold(
      appBar: AppBar(title: Text(other['name']), backgroundColor: Colors.white, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: false,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (c, i) {
                final m = _messages[i];
                return Align(
                  alignment: m['isMe'] ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: m['isMe'] ? Colors.blue[400] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(m['text'], style: TextStyle(color: m['isMe'] ? Colors.white : Colors.black87)),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(child: TextField(controller: _ctrl, decoration: const InputDecoration(hintText: "Message..."))),
                IconButton(icon: const Icon(Icons.send, color: Color(0xFF007AFF)), onPressed: _send),
              ]),
            ),
          )
        ],
      ),
    );
  }
}