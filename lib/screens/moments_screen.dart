import 'package:bookabro_proto/widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MomentsScreen extends StatelessWidget {
  const MomentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Moments', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Expanded(child: ListView.separated(itemCount: moments.length, separatorBuilder: (_,__) => const SizedBox(height: 12), itemBuilder: (context, i) {
          final m = moments[i];
          final user = users.firstWhere((u) => u.id == m.userId, orElse: () => currentUser);
          return PopIn(
            index: i,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [CircleAvatar(child: Text(user.name[0])), const SizedBox(width: 10), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(m.timeAgo, style: TextStyle(color: Colors.grey[600]))])]),
                const SizedBox(height: 8),
                Text(m.text),
              ]),
            ),
          );
        }))
      ])),
    );
  }
}
