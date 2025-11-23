import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF007AFF);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(previousPageTitle: 'Back', middle: Text(user.name)),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [
        CircleAvatar(radius: 44, child: Text(user.name[0], style: const TextStyle(fontSize: 28))),
        const SizedBox(height: 12),
        Text(user.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text('@${user.username}', style: TextStyle(color: Colors.grey[600])),
        const SizedBox(height: 14),
        Wrap(spacing: 8, children: [Chip(label: Text(user.vibe), backgroundColor: blue.withOpacity(0.12), labelStyle: TextStyle(color: blue))]),
        const SizedBox(height: 18),
        ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: blue, minimumSize: const Size.fromHeight(48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), child: const Text('Trust / Untrust')),
      ]))),
    );
  }
}
