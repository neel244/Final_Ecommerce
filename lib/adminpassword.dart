import 'package:flutter/material.dart';
import 'admin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminPassword extends StatefulWidget {
  @override
  _AdminPasswordState createState() => _AdminPasswordState();
}

class _AdminPasswordState extends State<AdminPassword> {
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Admin",
                      style: TextStyle(
                          fontSize: 88,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(270, 183, 0, 0),
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
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Enter Security Key',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                  obscureText: true,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 40.0,
                  child: Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        if (_password.text == "admin1234") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Admin()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Invalid Password",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 19.0);
                        }
                      },
                      child: Center(
                        child: Text(
                          "Enter",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text();
        ],
      ),
    );
  }
}
