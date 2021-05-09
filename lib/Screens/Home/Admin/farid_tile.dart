import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Models/product.dart';

class FaridTile extends StatelessWidget {
  final Product farid;

  const FaridTile({Key key, this.farid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: new Container(
            width: 50.0,
            height: 50.0,
            decoration: new BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: new AssetImage('assets/profile_photo.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: new BorderRadius.all(new Radius.circular(60.0)),
              border: new Border.all(
                color: Colors.green[farid.strength],
                width: 2.0,
              ),
            ),
          ),
          title: Text(farid.name),
          subtitle: Text(farid.sugar),
        ),
      ),
    );
  }
}

/*
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_4/Screens/Models/product.dart';

class FaridTile extends StatelessWidget {
  final Farid farid;

  const FaridTile({Key key, this.farid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green[Random.secure().nextInt(9) * 100],
            backgroundImage: AssetImage('assets/profile_photo.jpg'),
          ),
          title: Text(farid.name),
          subtitle: Text(farid.sugar),
        ),
      ),
    );
  }
}

* */
