import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'privacy_screen.dart';
import 'notification_settings_screen.dart';
import 'about_us_screen.dart';
import 'help_screen.dart';
import 'report_screen.dart';
import 'trust_network_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'Privacy', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const PrivacyScreen()))},
      {'title': 'Notifications', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const NotificationSettingsScreen()))},
      {'title': 'Trust Network', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const TrustNetworkScreen()))},
      {'title': 'Report', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const ReportScreen()))},
      {'title': 'Help', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const HelpScreen()))},
      {'title': 'About', 'action': () => Navigator.push(context, CupertinoPageRoute(builder: (_) => const AboutUsScreen()))},
    ];
    return SafeArea(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Settings', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 12),
      ...items.map((it) => Padding(padding: const EdgeInsets.only(bottom:12), child: GestureDetector(onTap: it['action'] as void Function()?, child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]), child: Row(children: [Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[600]), const SizedBox(width: 12), Text(it['title'] as String, style: const TextStyle(fontWeight: FontWeight.w600)), const Spacer(), const Icon(Icons.chevron_right)])))) )
    ])));
  }
}
