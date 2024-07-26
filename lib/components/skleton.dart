import 'package:flutter/material.dart';

class Skleton extends StatelessWidget {
  const Skleton({super.key, this.height, this.width});
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
      ),
    );
  }
}
