import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/wrapper.dart';
import 'package:provider/provider.dart';

import 'Screens/Authenticate/authendicate.dart';
import 'Screens/Intro/AnimatedSplashScreen.dart';
import 'Screens/Intro/IntroPage.dart';
import 'Screens/Models/user.dart';
import 'Services/auth.dart';
import 'Shared/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyFirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: Wrapper(showAnimationScreen: true),
        routes: <String, WidgetBuilder>{
          INTRO_SCREEN: (BuildContext context) => new IntroPage(),
          ANIMATED_SPLASH: (BuildContext context) => new AnimatedSplashScreen(),
          AUTH_SCREEN: (BuildContext context) => new Authenticate(),
          WRAPPER: (BuildContext context) => new Wrapper(),
        },
      ),
    );
  }
}
