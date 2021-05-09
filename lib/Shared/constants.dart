import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

const String INTRO_SCREEN = '/IntroPage',
    AUTH_SCREEN = '/AuthenticatePage',
    ANIMATED_SPLASH = '/AnimatedSplashScreen',
    WRAPPER = '/Wrapper';

const String ADMIN = 'ADMIN', TABLE = 'TABLE', LOADING = 'LOADING';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.red, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF65AE00), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

const searchTextInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFF65AE00), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

void showFloatingFlushbar(BuildContext context, String title, String message) {
  Flushbar(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
    borderRadius: 15,
    backgroundGradient: LinearGradient(
      colors: [Colors.green.shade800, Colors.greenAccent.shade700],
      stops: [0.6, 1],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.black45,
        offset: Offset(3, 3),
        blurRadius: 3,
      ),
    ],
    duration: Duration(seconds: 5),
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    title: title,
    message: message,
    icon: Icon(
      Icons.error,
      color: Colors.white,
    ),
  )..show(context);
}
