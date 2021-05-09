import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Home/Admin/settings_form.dart';
import 'package:flutter_restaurant_order/Screens/Models/product.dart';
import 'package:flutter_restaurant_order/Services/auth.dart';
import 'package:flutter_restaurant_order/Services/database.dart';
import 'package:provider/provider.dart';

import 'farid_list.dart';

class AdminHome extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products,
      child: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: Text('Firebase Test'),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingPanel(),
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              label: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/auth_back.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: FaridList()),
      ),
    );
  }
}
