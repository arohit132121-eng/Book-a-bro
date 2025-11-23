import 'package:bookabro_proto/widgets/animated_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/card_tile.dart';
import 'hangout_detail_screen.dart';

class HangoutsScreen extends StatelessWidget {
  const HangoutsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Hangouts Nearby', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), SizedBox.shrink()]),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: hangouts.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                final h = hangouts[i];
                return PopIn(
                  index: i,
                  child: CardTile(
                    leading: CircleAvatar(child: Text(h.title[0])),
                    title: h.title,
                    subtitle: '${h.subtitle} · ${h.vibe}',
                    trailing: h.time,
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => HangoutDetailScreen(h: h))),
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
