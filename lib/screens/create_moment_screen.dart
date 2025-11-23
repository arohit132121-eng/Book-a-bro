import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateMomentScreen extends StatefulWidget {
  const CreateMomentScreen({super.key});
  @override
  State<CreateMomentScreen> createState() => _CreateMomentScreenState();
}

class _CreateMomentScreenState extends State<CreateMomentScreen> {
  final _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Back', middle: Text('Create Vibe Moment')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            CupertinoTextField(controller: _text, placeholder: "What's on your mind?", maxLines: 4, padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12))),
            const SizedBox(height: 18),
            Expanded(child: Center(child: GestureDetector(onTap: () {}, child: Container(width: double.infinity, height: 180, decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(16)), child: const Center(child: Icon(Icons.image_outlined, size: 54, color: Color(0xFF007AFF))))))),
            ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF), minimumSize: const Size.fromHeight(52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: const Text('Post')),
          ]),
        ),
      ),
    );
  }
}
