import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SetupProfileScreen extends StatefulWidget {
  const SetupProfileScreen({super.key});

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();
}

class _SetupProfileScreenState extends State<SetupProfileScreen> {
  final _name = TextEditingController();
  final _location = TextEditingController();
  final vibes = ['Gaming', 'Chill', 'Music', 'Sports', 'Creative', 'Nature'];
  final selected = <String>{};

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Back', middle: Text('Set up your profile')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            const SizedBox(height: 10),
            CircleAvatar(radius: 36, child: Text('U')),
            const SizedBox(height: 18),
            CupertinoTextField(controller: _name, placeholder: 'Your name', padding: const EdgeInsets.all(14)),
            const SizedBox(height: 12),
            CupertinoTextField(controller: _location, placeholder: 'Your location', padding: const EdgeInsets.all(14)),
            const SizedBox(height: 18),
            const Align(alignment: Alignment.centerLeft, child: Text('Select your vibe', style: TextStyle(fontWeight: FontWeight.w700))),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: vibes.map((v) {
                final sel = selected.contains(v);
                return ChoiceChip(
                  label: Text(v),
                  selected: sel,
                  selectedColor: const Color(0xFF007AFF),
                  onSelected: (on) => setState(() => on ? selected.add(v) : selected.remove(v)),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF007AFF), minimumSize: const Size.fromHeight(52), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))), child: const Text('Continue'))
          ]),
        ),
      ),
    );
  }
}