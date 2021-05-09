import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_restaurant_order/Services/auth.dart';
import 'package:flutter_restaurant_order/Shared/Animations/fade_animation.dart';
import 'package:flutter_restaurant_order/Shared/constants.dart';
import 'package:flutter_restaurant_order/Shared/custom_radiobutton_group.dart';
import 'package:flutter_restaurant_order/Shared/loading.dart';

import 'Clippers/GreenClipper.dart';
import 'Clippers/ImageClipper.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;

  const SignUp({Key key, this.toggleView}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  bool _isFirstSelected = true;

  bool _isLoading = false;

  String _name = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double bottom = MediaQuery.of(context).viewInsets.bottom;

    final AuthService _authService = AuthService();

    void toggleRadioButton(bool isFirstSelected) {
      setState(() => _isFirstSelected = isFirstSelected);
    }

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
                          Container(
                            width: width,
                            height: height / 2.6,
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                                alignment: Alignment.bottomRight,
                                // top: height / 3,
                                // left: width / 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: widget.toggleView,
                                      child: Container(
                                          padding: const EdgeInsets.only(
                                              bottom: 2.0, right: 30),
                                          child: Text('Giriş',
                                              style: TextStyle(
                                                  fontFamily: 'MyFont',
                                                  fontSize: 14,
                                                  color: Colors.black45,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 2.0,
                                                    color: Color(0xFF65AE00)))),
                                        child: Text('Qeydiyyat',
                                            style: TextStyle(
                                                fontFamily: 'MyFont',
                                                fontSize: 18,
                                                color: Color(0xFF65AE00),
                                                fontWeight: FontWeight.bold)))
                                  ],
                                )),
                          ),
                        ],
                      ),
                      delay: 0.2,
                      isFromTopToDown: true,
                    ),
                    FadeAnimation(
                      Form(
                        key: _formKey,
                        child: Container(
                          height: height / 1.9,
                          padding: const EdgeInsets.fromLTRB(30, 0.0, 30, 20),
                          child: Column(
                            children: <Widget>[
                              CustomRadioButtonGroup(
                                backColor: Colors.white,
                                borderColor: Color(0xFF65AE00),
                                borderWidth: 1,
                                height: 60,
                                selectedButtonColor: Color(0xFF65AE00),
                                radius: 25,
                                selectedButtonTextColor: Colors.white,
                                isFirstSelected: _isFirstSelected,
                                toggleFunction: toggleRadioButton,
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                onChanged: (value) => setState(
                                    () => _name = value.toString().trim()),
                                validator: _validator,
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'Ad'),
                                // validator: _validate,
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                onChanged: (value) => setState(
                                    () => _password = value.toString().trim()),
                                validator: _validator,
                                obscureText: true,
                                decoration: textInputDecoration.copyWith(
                                    labelText: 'Şifrə'),
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
                                          .registerWithEmailAndPassword(
                                          _name + '@mail.ru',
                                          _password,
                                          _isFirstSelected
                                              ? TABLE
                                              : ADMIN);
                                      setState(() {
                                        _isLoading = false;

                                        if (result == null)
                                          showFloatingFlushbar(
                                              context,
                                              'Hesab Açılarkən Xəta Baş Verdi!',
                                              'Ad və ya Şifrə səhv ola bilər');
                                      });
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.check,
                                          color: Colors.white),
                                      SizedBox(width: 15),
                                      Text('QEYDIYYATDAN KEÇ',
                                          style: TextStyle(
                                              fontFamily: 'MyFont',
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 2)),
                                    ],
                                  ),
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
