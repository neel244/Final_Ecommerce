import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Red",
      "quantity": 1
    },
    {
      "name": "Shoes",
      "picture": "images/hills2.jpeg",
      "price": 50,
      "size": "7",
      "color": "Red",
      "quantity": 1
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_picture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_color,
    this.cart_prod_price,
    this.cart_prod_picture,
    this.cart_prod_qty,
    this.cart_prod_size,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // =====================Leading Section=============
        leading: new Container(
          height: 120.0,
          width: 80.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage(cart_prod_picture),
              fit: BoxFit.fill,
            ),
            // shape: BoxShape.circle,
          ),
        ),
        // ====================title section=========
        title: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          child: new Text(cart_prod_name),
        ),

        // ================subtitle section===========
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(cart_prod_size),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                  child: new Text(cart_prod_color),
                ),
              ],
            ),

            // ===================Product Price==================
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Rs $cart_prod_price",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            )
          ],
        ),
        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_drop_up),
                  iconSize: 1000,
                  onPressed: () {}),
              Text(
                '$cart_prod_qty',
                style: TextStyle(fontSize: 500, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 1000,
                  onPressed: () {}),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              //   child: IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
