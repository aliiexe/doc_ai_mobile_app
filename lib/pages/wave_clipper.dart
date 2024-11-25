import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50); // Start from bottom-left
    path.quadraticBezierTo(
      size.width / 4, size.height,
      size.width / 2, size.height - 50,
    ); // First curve
    path.quadraticBezierTo(
      size.width * 3 / 4, size.height - 100,
      size.width, size.height - 50,
    ); // Second curve
    path.lineTo(size.width, 0); // Top-right
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // No need to reclip
  }
}
