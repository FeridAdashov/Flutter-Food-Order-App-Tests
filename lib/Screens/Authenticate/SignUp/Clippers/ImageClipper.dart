import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1.3);

    path.quadraticBezierTo(
        size.width / 3.5,
        size.height / 1.1,
        size.width / 1.9,
        size.height / 1.6);

    path.quadraticBezierTo(
        size.width / 1.3,
        size.height / 3,
        size.width,
        size.height / 3.5);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
