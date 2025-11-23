import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class HangoutDetailScreen extends StatelessWidget {
  final Hangout h;
  const HangoutDetailScreen({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Back'),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(h.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(height: 140, decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12))),
            const SizedBox(height: 12),
            Text('${h.subtitle} • ${h.time}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 18),
            ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF), minimumSize: const Size.fromHeight(48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: const Text('Join Hangout')),
          ]),
        ),
      ),
    );
  }
}
