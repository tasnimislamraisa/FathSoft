import 'package:flutter/material.dart';

class InfoCardWithSubText extends StatelessWidget {
  final String title;
  final String value;
  final String subValue;
  final Color color;

  const InfoCardWithSubText({
    super.key,
    required this.title,
    required this.value,
    required this.subValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(subValue,
              style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }
}
