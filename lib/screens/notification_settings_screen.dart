import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(previousPageTitle: 'Settings', middle: Text('Notifications')),
      child: SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(children: [
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]), child: Column(children: [
          Row(children: const [Text('Comments', style: TextStyle(fontWeight: FontWeight.w600)), Spacer(), CupertinoSwitch(value: true, onChanged: null)]),
          const SizedBox(height: 8),
          Row(children: const [Text('Likes', style: TextStyle(fontWeight: FontWeight.w600)), Spacer(), CupertinoSwitch(value: true, onChanged: null)]),
          const SizedBox(height: 8),
          Row(children: const [Text('Follows', style: TextStyle(fontWeight: FontWeight.w600)), Spacer(), CupertinoSwitch(value: true, onChanged: null)]),
        ]))
      ]))),
    );
  }
}
