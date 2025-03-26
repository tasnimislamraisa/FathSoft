import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final isRequired = title.trim().startsWith("*");
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 6),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isRequired ? Colors.red.shade700 : Colors.black,
        ),
      ),
    );
  }
}
