import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final String trailing;
  final VoidCallback? onTap;
  const CardTile({super.key, required this.leading, required this.title, required this.subtitle, required this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 6))],
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey[600])),
              ]),
            ),
            const SizedBox(width: 8),
            Text(trailing, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
