import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600, width: 3),
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey.shade200,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
