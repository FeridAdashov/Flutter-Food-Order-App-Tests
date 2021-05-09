import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_restaurant_order/Services/auth.dart';
import 'package:flutter_restaurant_order/Shared/Animations/fade_animation.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';
import 'package:flutter_restaurant_order/Shared/loading.dart';

import 'Clippers/GreenClipper.dart';
import 'Clippers/ImageClipper.dart';

class Login extends StatefulWidget {
  final Function toggleView;

  const Login({Key key, this.toggleView}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String _name = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double bottom = MediaQuery.of(context).viewInsets.bottom;

    final AuthService _authService = AuthService();

    String _validator(String text) {
      return (text.isEmpty || text.length < 5) ? 'Simvol sayi azdır!' : null;
    }

    return _isLoading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.only(bottom: bottom),
                child: Column(
                  children: <Widget>[
                    FadeAnimation(
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: ImageClipper(),
                            child: Container(
                              height: height / 2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/auth_back.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          ClipPath(
                            clipper: GreenClipper(),
                            child: Container(
                              height: height / 2,
                              color: Color(0xFF65AE00),
                            ),
                          ),
                          Positioned(
                              top: height / 3,
                              left: 30,
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 2.0,
                                                  color: Color(0xFF65AE00)))),
                                      child: Text('Giriş',
                                          style: TextStyle(
                                              fontFamily: 'MyFont',
                                              fontSize: 18,
                                              color: Color(0xFF65AE00),
                                              fontWeight: FontWeight.bold))),
                                  GestureDetector(
                                    onTap: widget.toggleView,
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 2.0, left: 50),
                                        child: Text('Qeydiyyat',
                                            style: TextStyle(
                                                fontFamily: 'MyFont',
                                                fontSize: 14,
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold))),
                                  )
                                ],
                              )),
                          Positioned(
                              top: height / 2.5,
                              left: 30,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text('Xoş Gəlmisiniz!',
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Color(0xFF65AE00),
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2))),
                                  SizedBox(height: 5),
                                  Container(
                                      child: Text('Daxil olmaq üçn davam edin',
                                          style: TextStyle(
                                              fontFamily: 'MyFont',
                                              fontSize: 14,
                                              color: Colors.black45,
                                              letterSpacing: 2))),
                                ],
                              )),
                        ],
                      ),
                      delay: 0.2,
                      isFromTopToDown: true,
                    ),
                    FadeAnimation(
                      Form(
                        key: _formKey,
                        child: Container(
                          height: height / 2,
                          padding: const EdgeInsets.fromLTRB(30, 30.0, 30, 20),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                  onChanged: (value) => setState(
                                      () => _name = value.toString().trim()),
                                  validator: _validator,
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Ad'),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z0-9_]"))
                                  ]
                                  ),
                              SizedBox(height: 15),
                              TextFormField(
                                  obscureText: true,
                                  onChanged: (value) => setState(() =>
                                      _password = value.toString().trim()),
                                  validator: _validator,
                                  decoration: textInputDecoration.copyWith(
                                      labelText: 'Şifrə'),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[a-zA-Z0-9_]"))
                                  ]
                                  // validator: _validate,
                                  ),
                              Spacer(),
                              Container(
                                width: width,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(25.0),
                                    ),
                                    primary: Color(0xFF65AE00),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState.validate()) {
                                      setState(() => _isLoading = true);
                                      dynamic result = await _authService
                                          .signInWithEmailAndPassword(
                                              _name + '@mail.ru', _password);

                                      if (result == null) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        showFloatingFlushbar(
                                            context,
                                            'Hesab Açılarkən Xəta Baş Verdi!',
                                            'Ad və ya Şifrə səhv ola bilər');
                                      }
                                    }
                                  },
                                  child: Text('DAXIL OL',
                                      style: TextStyle(
                                          fontFamily: 'MyFont',
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isFromTopToDown: false,
                      delay: 0.2,
                    )
                  ],
                ),
              ),
            ));
  }
}
