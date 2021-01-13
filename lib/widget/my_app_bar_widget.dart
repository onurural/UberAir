import 'package:flutter/material.dart';
import 'package:uberAir/widget/my_side_bar_menu_widget.dart';
import 'package:uberAir/widget/sign_in_widget.dart';
import 'package:uberAir/widget/sign_up_widget.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.menu,
                color: Colors.amberAccent,
                size: 25,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyDrawer()));
              }),
          SizedBox(
            width: 70,
          ),
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
    );
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
              children: <Widget>[
                buildDrawerHeader(),
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
                      top: BorderSide(width: 0.5, color: Colors.black),
                      bottom: BorderSide(width: 0.5, color: Colors.black),
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
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(width: 0.5, color: Colors.black),
                  )),
                  child: ListTile(
                    onTap: () {},
                    title: Text('Flights',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    trailing: Icon(Icons.chevron_right),
                  ),
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 1,
        ),
        Text("BuildExpansionTile here"),
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
              SignInButton(Buttons.GoogleDark, onPressed: () {})
            ],
          )
        ],
      ),
    );
  }
}

buildDrawerHeader() {
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
        margin: EdgeInsets.only(left: 10),
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
