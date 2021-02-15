import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uberAir/view_model/authentication_view_model.dart';
import 'package:uberAir/widget/home_screen.dart';
import 'package:uberAir/widget/upload_ticket_screen.dart';
import 'package:uberAir/widget/privacy_policy.dart';
import 'package:uberAir/widget/sign_in_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'aboutus_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      elevation: 16,
      child: Container(
        color: Colors.white,
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange[900], Colors.blue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                BuildDrawerHeader(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(10, 0, 5, 4),
                  child: Text(
                    "Welcome to UberAir. Please sign in or sign up to see deals and much more.",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildExpansionTile(context),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5, color: Colors.black38),
                      bottom: BorderSide(width: 0.5, color: Colors.black38),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpWidget()));
                    },
                    title:
                        Text('Sign Up', style: TextStyle(color: Colors.black)),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                Provider.of<AuthenticationViewModel>(context).isLogedIn()?_myTicketWidget(context):Container(),
                Row(
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PrivacyPolicy()));
                        },
                        child: Text("Privacy Policy")),
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                Row(
                  children: [
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()));
                        },
                        child: Text("About Us")),
                  ],
                ),
                Provider.of<AuthenticationViewModel>(context).isLogedIn()?buildExpansionTileSettings(context):Container(),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ],
            )),
      ),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Text("BuildDrawerHere"),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(10, 0, 5, 4),
          child: Text(
            "Welcome to UberAir. Please sign in or sign up to see deals and much more.",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInWidget()));
          },
          title: Text('Sign Up', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          onTap: () {},
          title: Text('Flights',
              style: TextStyle(
                color: Colors.black,
              )),
          trailing: Icon(Icons.chevron_right),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildExpansionTileSettings(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.5, color: Colors.black),
      )),
      child: ExpansionTile(
        title: Text(
          "Settings",
        ),
        children: [
          Column(
            children: <Widget>[
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                      },
                      child: Text("Change Password")),
                ],
              ),
              Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangeEmail()));
                      },
                      child: Text("Change Email")),
                ],
              ),
              RaisedButton(
                color: Colors.red,
                onPressed: () {
                  context.read<AuthenticationViewModel>().signOut();
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyFlightInfoField()));
                },
                child: Text('Log Out',
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildExpansionTile(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 0.5, color: Colors.black),
      )),
      child: ExpansionTile(
        title: Text(
          "Sign In",
        ),
        children: [
          Column(
            children: <Widget>[
              SignInButton(Buttons.Email, onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInWidget()));
              }),
              SignInButton(Buttons.GoogleDark, onPressed: () {
                _signInWithGoogle();
              })
            ],
          )
        ],
      ),
    );
  }

  Future<UserCredential> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Gmail ile giriş hata $e");
    }
  }

  _myTicketWidget(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.black12),
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TicketUploadScreen()));
          },
          title: Text('My Tickets', style: TextStyle(color: Colors.black)),
          trailing: Icon(Icons.chevron_right),
        ),
      );
}

class BuildDrawerHeader extends StatelessWidget {
  const BuildDrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        alignment: Alignment.topCenter,
        child: DrawerHeader(
          child: null,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    "assets/plane.jpg",
                  ))),
        ),
      ),
      Container(
        padding: EdgeInsets.all(20),
        child: Row(
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
    ]);
  }
}
