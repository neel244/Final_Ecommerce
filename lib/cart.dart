import 'package:flutter/material.dart';
import 'cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.red,
          title: Text('Cart'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: Cart_products(),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: Text("Total"),
                subtitle: Text("230"),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.red,
                child: Text("Checkout"),
                textColor: Colors.white,
              ))
            ],
          ),
        ));
  }
}
