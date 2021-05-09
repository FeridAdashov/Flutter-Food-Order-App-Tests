import 'package:flutter/material.dart';
import 'package:flutter_restaurant_order/Screens/Models/user.dart';
import 'package:flutter_restaurant_order/Services/database.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';
import 'package:flutter_restaurant_order/Shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //Form Values
  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyFirebaseUser>(context);

    return Container();

    // return StreamBuilder<UserData>(
    //     stream: DatabaseService(uid: user.name).userData,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         UserData userData = snapshot.data;
    //
    //         return Form(
    //           key: _formKey,
    //           child: Column(
    //             children: [
    //               Text(
    //                 'Update your farid setting',
    //                 style: TextStyle(fontSize: 18),
    //               ),
    //               SizedBox(height: 20.0),
    //               TextFormField(
    //                 initialValue: userData.name,
    //                 decoration: textInputDecoration,
    //                 validator: (val) =>
    //                     val.isEmpty ? "Please enter a name" : null,
    //                 onChanged: (val) => setState(() => _currentName = val),
    //               ),
    //               SizedBox(height: 20.0),
    //               //dropdown
    //               DropdownButtonFormField(
    //                 value: _currentSugar ?? userData.sugar,
    //                 items: sugars.map((sugar) {
    //                   return DropdownMenuItem(
    //                     value: sugar,
    //                     child: Text('$sugar sugars'),
    //                   );
    //                 }).toList(),
    //                 onChanged: (val) => setState(() => _currentSugar = val),
    //               ),
    //               //slider
    //               Slider(
    //                   value: (_currentStrength ?? userData.strength).toDouble(),
    //                   min: 100,
    //                   max: 900,
    //                   divisions: 8,
    //                   activeColor:
    //                       Colors.green[_currentStrength ?? userData.strength],
    //                   inactiveColor:
    //                       Colors.green[_currentStrength ?? userData.strength],
    //                   onChanged: (val) =>
    //                       setState(() => _currentStrength = val.round())),
    //               RaisedButton(
    //                   color: Colors.pink[400],
    //                   child: Text(
    //                     'Update',
    //                     style: TextStyle(color: Colors.white),
    //                   ),
    //                   onPressed: () async {
    //                     if (_formKey.currentState.validate())
    //                       await DatabaseService(uid: user.name).setUserData(
    //                           _currentName ?? userData.name,
    //                           _currentSugar ?? userData.sugar,
    //                           _currentStrength ?? userData.strength);
    //                     Navigator.pop(context);
    //                   })
    //             ],
    //           ),
    //         );
    //       } else {
    //         return Loading();
    //       }
    //     });
  }
}
