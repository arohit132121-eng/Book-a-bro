import 'package:bookabro_proto/widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/card_tile.dart';
import 'hangout_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF007AFF);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hi, ${currentUser.name.split(' ')[0]} 👋', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                BounceButton(
                  onTap: () => Navigator.pushNamed(context, '/create-moment'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(color: blue.withOpacity(0.12), borderRadius: BorderRadius.circular(12)),
                    child: Row(children: const [Icon(Icons.add, size: 18, color: Color(0xFF007AFF)), SizedBox(width: 8), Text('Add', style: TextStyle(color: Color(0xFF007AFF)))]),
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]),
              child: Row(
                children: [
                  const Text('Trusted Bros Only', style: TextStyle(fontWeight: FontWeight.w600)),
                  const Spacer(),
                  CupertinoSwitch(value: false, onChanged: (_) {}),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Vibe Moments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), SizedBox.shrink()]),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ...moments.asMap().entries.map((entry) {
                    final i = entry.key;
                    final m = entry.value;
                    final user = users.firstWhere((u) => u.id == m.userId, orElse: () => currentUser);
                    return PopIn(
                      index: i,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))]),
                          padding: const EdgeInsets.all(12),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Row(children: [
                              CircleAvatar(radius: 20, child: Text(user.name[0])),
                              const SizedBox(width: 10),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(m.timeAgo, style: TextStyle(color: Colors.grey[600], fontSize: 12))]),
                            ]),
                            const SizedBox(height: 10),
                            Text(m.text),
                            const SizedBox(height: 8),
                            Row(children: [
                              Icon(Icons.favorite_border, color: Colors.grey[700]),
                              const SizedBox(width: 6),
                              Text('${m.likes}', style: TextStyle(color: Colors.grey[700])),
                              const SizedBox(width: 16),
                              Icon(Icons.comment_outlined, color: Colors.grey[700]),
                              const SizedBox(width: 6),
                              Text('${m.comments}', style: TextStyle(color: Colors.grey[700])),
                            ]),
                          ]),
                        ),
                      ),
                    );
                  }).toList(),

                  const SizedBox(height: 8),
                  const Text('Nearby Hangouts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  ...hangouts.asMap().entries.map((entry) {
                    final i = entry.key;
                    final h = entry.value;
                    return PopIn(
                      index: i + moments.length,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: CardTile(
                          leading: CircleAvatar(child: Text(h.title[0])),
                          title: h.title,
                          subtitle: '${h.subtitle} · ${h.vibe}',
                          trailing: '${h.bros} bros',
                          onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => HangoutDetailScreen(h: h))),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
