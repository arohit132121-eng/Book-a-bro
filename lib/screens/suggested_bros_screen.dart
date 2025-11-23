import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class SuggestedBrosScreen extends StatefulWidget {
  const SuggestedBrosScreen({super.key});
  @override
  State<SuggestedBrosScreen> createState() => _SuggestedBrosScreenState();
}

class _SuggestedBrosScreenState extends State<SuggestedBrosScreen> {
  List<UserModel> list = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _compute();
  }

  void _compute() async {
    await Future.delayed(const Duration(milliseconds: 400));
    // naive scoring: random-ish but deterministic by name length
    final scored = users.where((u) => u.id != currentUser.id).toList();
    scored.sort((a,b) => b.name.length.compareTo(a.name.length));
    setState(() { list = scored.take(6).toList(); loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    final blue = const Color(0xFF007AFF);
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Back', middle: Text('Suggested Bros')),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: loading ? const Center(child: CupertinoActivityIndicator()) : ListView.builder(itemCount: list.length, itemBuilder: (c,i){
        final u = list[i];
        return Container(padding: const EdgeInsets.all(12), margin: const EdgeInsets.only(bottom:12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]), child: Row(children: [
          CircleAvatar(child: Text(u.name[0])),
          const SizedBox(width:12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(u.name, style: const TextStyle(fontWeight: FontWeight.bold)), Text(u.vibe, style: TextStyle(color: Colors.grey[600]))])),
          ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: blue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), child: const Text('View'))
        ]));
      }))),
    );
  }
}
