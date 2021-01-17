import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email;
    String _password;
    String _newPassword;
    String _confirmNewPassword;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.orange[900], Colors.blue],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                "We need your old password and email to change your password !",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 20),
              ),
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
            Container(
                child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter password",
                  prefixIcon: Icon(Icons.lock),
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
            )),
            Container(
                child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter new password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (String data) {
                Pattern pattern =
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(data)) {
                  return "Password should contain upper letter\n number, special characters and at least 8 characters";
                } else {
                  _newPassword = data;
                  return null;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            )),
            Container(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (String data) {
                  if ((_newPassword != data)) {
                    return "Passwords are not match";
                  } else {
                    _confirmNewPassword = data;

                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            Container(
              width: 200,
              child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  if (_email == null) {
                    toastMesagge("mail adress");
                  } else if (_password == null) {
                    toastMesagge("password");
                  } else if (_newPassword == null) {
                    toastMesagge("new password");
                  } else if (_confirmNewPassword == null) {
                    toastMesagge("confirm password");
                  } else if (!context
                      .read<AuthenticationViewModel>()
                      .isLogedIn()) {
                    Fluttertoast.showToast(
                        msg: "Users should be loged in before change password",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    context
                        .read<AuthenticationViewModel>()
                        .updatePassword(_email, _password, _newPassword);
                    Fluttertoast.showToast(
                        msg: "password changed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text("SAVE"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toastMesagge(String text) {
    Fluttertoast.showToast(
        msg: "Please enter $text",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
