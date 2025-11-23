import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/root_shell.dart';

void main() {
  runApp(const BookABroApp());
}

class BookABroApp extends StatelessWidget {
  const BookABroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Book a Bro (proto)',
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF007AFF),
      ),
      debugShowCheckedModeBanner: false,
      home: const RootShell(),
    );
  }
}
