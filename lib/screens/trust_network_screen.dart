import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class TrustNetworkScreen extends StatelessWidget {
  const TrustNetworkScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // list trusted and trustedBy (dummy)
    final trusted = [users[1], users[2]];
    final trustedBy = [users[3]];
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Settings', middle: Text('Trust Network')),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('You trust', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height:8),
        Wrap(spacing:8, children: trusted.map((u)=>Chip(label: Text(u.name))).toList()),
        const SizedBox(height:14),
        const Text('Trusted you', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height:8),
        Wrap(spacing:8, children: trustedBy.map((u)=>Chip(label: Text(u.name))).toList()),
      ]))),
    );
  }
}
