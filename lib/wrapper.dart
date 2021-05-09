import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Authenticate/authendicate.dart';
import 'package:flutter_restaurant_order/Screens/Intro/AnimatedSplashScreen.dart';
import 'package:flutter_restaurant_order/Services/database.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';
import 'package:flutter_restaurant_order/Shared/loading.dart';
import 'package:provider/provider.dart';

import 'Screens/Home/Admin/admin_home.dart';
import 'Screens/Home/Table/table_home.dart';
import 'Screens/Models/user.dart';

class Wrapper extends StatelessWidget {
  final bool showAnimationScreen;

  const Wrapper({Key key, this.showAnimationScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyFirebaseUser>(context);

    return user == null
        ? showAnimationScreen
            ? AnimatedSplashScreen()
            : Authenticate()
        : FutureBuilder(
            future: DatabaseService(name: user.name).getUserType(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              String type = snapshot.data;

              if (type == LOADING)
                return Loading();
              else if (type == ADMIN)
                return AdminHome();
              else
                return TableHome();
            },
            initialData: LOADING);
  }
}
