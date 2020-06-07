import 'package:flutter/material.dart';
import 'firebase_auth.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  AuthProvider _authProvider = AuthProvider();
  String email = "";
  String password = "";

  @override
  void initState() {
    // getuserinfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 90, 0, 0),
                    child: Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: 88,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 175, 0, 0),
                    child: Text(
                      "There",
                      style: TextStyle(
                          fontSize: 88,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(245, 183, 0, 0),
                  child: Text(
                    ".",
                    style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                )
              ],
            ),
          ),
          // Text();
        ],
      ),
    );
  }

  // void getuserinfo() {
  //   setState(() {
  //     email = _authProvider.getuseremail();
  //   });
  // }
}
