import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'horizontal_list.dart';
import 'products.dart';
import 'cart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'firebase_auth.dart';
import 'admin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: false,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Fashapp'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "You Have Successfully Logged In ",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 18.0);
            },
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => Cart()));
            },
          )
        ],
      ),
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          //header
          UserAccountsDrawerHeader(
            decoration: new BoxDecoration(color: Colors.red),
            accountName: Text('Neel Gada'),
            accountEmail: Text('neel.hg@somaiya.edu'),
            currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            )),
          ),
          //body
          //Inkwell used when we want to tap and go on a new page
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_cart, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                  context, new MaterialPageRoute(builder: (context) => Cart()));
            },
            child: ListTile(
              title: Text('Shopping Cart'),
              leading: Icon(Icons.shopping_cart, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),

          Divider(),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help, color: Colors.red),
            ),
          ),

          InkWell(
            onTap: () {
              AuthProvider().logOut();
            },
            child: ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app, color: Colors.red),
            ),
          ),
          InkWell(
            onTap: () async {
              bool res = await AuthProvider().getCurrentUserEmail();
              if (res) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Admin()));
              }
            },
            child: ListTile(
              title: Text('Admin'),
              leading: Icon(Icons.person, color: Colors.red),
            ),
          ),
        ],
      )),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Text(
              'Categories',
              textAlign: TextAlign.left,
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
          //Horizontal list begins here
          HorizontalList(),

          new Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Recent Products',
                textAlign: TextAlign.left,
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              )),

          // gridview
          Container(
            height: 230,
            child: Products(),
          )
          // Flexible(child: Products())
        ],
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text("Home page"),
//             RaisedButton(
//               child: Text("Log out"),
//               onPressed: () {
//                 AuthProvider().logOut();
//               } ,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
