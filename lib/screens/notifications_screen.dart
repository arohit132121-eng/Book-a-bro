import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {'title': 'Anna liked your post', 'time': '2h'},
      {'title': 'Jake commented: "Sounds fun!"', 'time': '3h'},
      {'title': 'Olivia trusted you', 'time': '1d'},
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Notifications', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final n = notifications[i];
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]),
                  child: Row(children: [
                    CircleAvatar(child: Text(n['title']![0])),
                    const SizedBox(width: 12),
                    Expanded(child: Text(n['title']!, style: const TextStyle(fontWeight: FontWeight.w600))),
                    Text(n['time']!, style: TextStyle(color: Colors.grey[600])),
                  ]),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}