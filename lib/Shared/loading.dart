import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFAED5D3),
      child: Center(
        child: SpinKitDualRing(
          color: Colors.green,
          size: 100,
        ),
      ),
    );
  }
}
