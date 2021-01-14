import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';
import 'package:provider/provider.dart';

String _email;

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange[900], Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Uber",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                        fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Air",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.amberAccent,
                        fontSize: 40),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  "We will send link to your mail adress to save your password. You can reset your password by click the link !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  
                  decoration: InputDecoration(
                      hintText: "Enter email",
                      prefixIcon: Icon(Icons.email),
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                child: RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    context
                        .read<AuthenticationViewModel>()
                        .resetPassword(_email);
                    Fluttertoast.showToast(
                        msg: "Please check your email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text("SEND"),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
