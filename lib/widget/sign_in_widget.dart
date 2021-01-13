import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';

String _email;
String _password;

class SignInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 85,
                ),
                alignment: Alignment.center,
                child: Column(children: <Widget>[
                  buildText1(),
                  Container(
                    padding: EdgeInsets.only(
                      right: 50,
                      left: 50,
                      top: 140,
                    ),
                    child: Column(
                      children: <Widget>[
                        buildText2(),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "E-Mail",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (String input) {
                              _email = input;
                              return null;
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (String input) {
                                _password = input;
                                return null;
                              }),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 450,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)),
                            child: Text("Sign in"),
                            onPressed: () {
                              context
                                  .read<AuthenticationViewModel>()
                                  .signIn(_email, _password);
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
      padding: EdgeInsets.only(bottom: 25),
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
