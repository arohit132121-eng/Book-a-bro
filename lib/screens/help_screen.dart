import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final faqs = [
      {'q': 'How to create a hangout?', 'a': 'Go to Hangouts → Tap an item or + to add.'},
      {'q': 'How to report someone?', 'a': 'Settings → Report.'},
    ];
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Settings', middle: Text('Help')),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: ListView.separated(itemCount: faqs.length, separatorBuilder: (_,__)=>const SizedBox(height:12), itemBuilder: (c,i){
        final f = faqs[i];
        return Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(f['q']!, style: const TextStyle(fontWeight: FontWeight.bold)), const SizedBox(height:6), Text(f['a']!)]));
      }))),
    );
  }
}
