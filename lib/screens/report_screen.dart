import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String reason = 'Harassment';
  final _notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Settings', middle: Text('Report')),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [
        const Text('Report User', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(value: reason, items: ['Harassment','Spam','Other'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(), onChanged: (v) => setState(()=>reason=v!)),
        const SizedBox(height: 12),
        CupertinoTextField(controller: _notes, placeholder: 'Notes (optional)', maxLines: 5, padding: const EdgeInsets.all(12)),
        const SizedBox(height: 16),
        ElevatedButton(onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Reported — thanks bro'))); Navigator.pop(context); }, style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: const Color(0xFF007AFF)), child: const Text('Submit Report'))
      ]))),
    );
  }
}
