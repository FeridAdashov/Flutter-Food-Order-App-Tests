import 'package:flutter/material.dart';

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(0.0, size.height / 1.4);
    path.lineTo(0.0, size.height / 1.3);

    path.quadraticBezierTo(
        size.width / 3.5,
        size.height / 1.1,
        size.width / 1.9,
        size.height / 1.6);

    path.quadraticBezierTo(
        size.width / 1.48,
        size.height / 2.18,
        size.width / 1.28,
        size.height / 2.6);

    path.quadraticBezierTo(
        size.width / 3,
        size.height / 3,
        0.0,
        size.height / 1.4);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
