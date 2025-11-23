import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'chat_list_screen.dart';
import 'hangouts_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _selected = 0;
  final pages = const [
    HomeScreen(),
    ChatListScreen(),
    HangoutsScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _selected,
        activeColor: const Color(0xFF007AFF),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_2), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_2), label: 'Hangouts'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: 'Settings'),
        ],
        onTap: (i) => setState(() => _selected = i),
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(transitionBetweenRoutes: false, middle: Text('')),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) {
              final offsetAnim = Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero).animate(anim);
              return SlideTransition(position: offsetAnim, child: FadeTransition(opacity: anim, child: child));
            },
            child: SizedBox(key: ValueKey<int>(_selected), width: double.infinity, height: double.infinity, child: pages[index]),
          ),
        );
      },
    );
  }
}
