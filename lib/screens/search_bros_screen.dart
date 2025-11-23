import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class SearchBrosScreen extends StatefulWidget {
  const SearchBrosScreen({super.key});
  @override
  State<SearchBrosScreen> createState() => _SearchBrosScreenState();
}

class _SearchBrosScreenState extends State<SearchBrosScreen> {
  String query = '';
  @override
  Widget build(BuildContext context) {
    final results = users.where((u) => u.name.toLowerCase().contains(query.toLowerCase()) || u.username.toLowerCase().contains(query.toLowerCase())).toList();
    return SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [
      CupertinoTextField(onChanged: (v) => setState(() => query = v), placeholder: 'Search bros by name or username', prefix: const Padding(padding: EdgeInsets.all(8), child: Icon(Icons.search))),
      const SizedBox(height: 12),
      Expanded(child: ListView.separated(itemCount: results.length, separatorBuilder: (_,__) => const SizedBox(height: 12), itemBuilder: (context, i) {
        final u = results[i];
        return ListTile(leading: CircleAvatar(child: Text(u.name[0])), title: Text(u.name), subtitle: Text('@${u.username} • ${u.vibe}'), trailing: CupertinoButton(child: const Text('View'), onPressed: () {}));
      }))
    ])));
  }
}
