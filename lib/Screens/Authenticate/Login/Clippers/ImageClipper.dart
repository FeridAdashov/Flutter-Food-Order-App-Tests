import 'package:flutter/material.dart';

class ImageClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height / 1.5);

    path.quadraticBezierTo(
        size.width / 2.3,
        size.height / 8, //point #3
        size.width / 1.4,
        size.height / 1.5); //point #4

    path.quadraticBezierTo(
        size.width / 1.2, size.height, size.width, size.height);

    path.lineTo(size.width, size.height); //move to top right #7
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
