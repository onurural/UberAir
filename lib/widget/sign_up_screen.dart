import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';
import 'package:uberAir/widget/home_screen.dart';

String _nameSurname;
String _email;
String _password;

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _confirmedPassword;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: buildBoxDecoration(),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  buildText1(),
                  Container(
                    padding: EdgeInsets.only(
                      right: 50,
                      left: 50,
                      top: 75,
                    ),
                    child: Column(
                      children: <Widget>[
                        buildText2(),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Name and Surname",
                                prefixIcon: Icon(Icons.person),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              if (data.length < 4) {
                                _nameSurname = data;
                                return "Please enter full name and surname";
                              } else {
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "E-Mail",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = new RegExp(pattern);

                              if (!regex.hasMatch(data)) {
                                return "unvalid email";
                              } else {
                                _email = data;
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              Pattern pattern =
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(data)) {
                                return "Password should contain upper letter\n number, special characters and at least 8 characters";
                              } else {
                                _password = data;
                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                hintText: "Confirm Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            validator: (String data) {
                              if (!(_password == data)) {
                                return "Passwords are not match";
                              } else {
                                _confirmedPassword = data;

                                return null;
                              }
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 450,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)),
                            child: Text("Sign up"),
                            onPressed: () {
                              if (_nameSurname == null) {
                                Fluttertoast.showToast(
                                    msg: "Please enter name and surname",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                return;
                              } else if (_email == null) {
                                Fluttertoast.showToast(
                                    msg: "Please enter E-Mail",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (_password == null) {
                                Fluttertoast.showToast(
                                    msg: "Please enter password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (_confirmedPassword == null) {
                                Fluttertoast.showToast(
                                    msg: "Please confirm your password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else {
                                context
                                    .read<AuthenticationViewModel>()
                                    .signUp(_email, _password);
                                Fluttertoast.showToast(
                                    msg:
                                        "We send you a link to your mail adress please verify",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                   Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => MyFlightInfoField()));
                              }
                            },
                            elevation: 10,
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.orange[900],
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.amber[900]]));
  }

  Container buildText2() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Uber",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amberAccent,
                  fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Text(
              "Air",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.amberAccent,
                  fontSize: 35),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Container buildText1() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "WELCOME BACK TO ",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          Text(
            "UBER AIR",
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ],
      ),
    );
  }
}
