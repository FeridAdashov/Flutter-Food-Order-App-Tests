import 'package:flutter/material.dart';

class ImageOpenContainer extends StatelessWidget {
  const ImageOpenContainer({
    Key key,
    @required this.openContainer,
    @required this.imagePath,
    this.height,
    this.width,
  }) : super(key: key);

  final VoidCallback openContainer;
  final String imagePath;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openContainer,
      child: Container(
        height: height,
        width: width,
        child: FittedBox(
          child: Image.asset('$imagePath'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
