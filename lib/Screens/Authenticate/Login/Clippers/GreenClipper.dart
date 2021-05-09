import 'package:flutter/material.dart';

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.moveTo(size.width / 2.3, size.height / 2.5);

    path.quadraticBezierTo(
        size.width / 1.2, size.height / 2.3, size.width, size.height / 1.2);

    path.lineTo(size.width, size.height);

    path.cubicTo(
        size.width / 1.4, size.height,
        size.width / 1.5, size.height / 2.3,
        size.width / 2.3, size.height / 2.5
    );


    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
