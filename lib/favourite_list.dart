import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteList extends StatefulWidget {
  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Your Favourites"),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('favourite').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                    itemCount: snapshot.data.documents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot products =
                          snapshot.data.documents[index];
                      return Single_prod(
                          prod_name: products['name'],
                          prod_picture: products['images'],
                          prod_old_price: products['quantity'],
                          // product_list[index]['quantity'].toString(),
                          prod_price: products['price'],
                          prod_id: products['id']);
                      // product_list[index]['price'].toString());
                    });
              }
            }));
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_id;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price,
      this.prod_id});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: new Text("hero 1"),
      child: Material(
        child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_new_price: prod_price,
                      product_detail_quantity: prod_old_price,
                      product_detail_picture: prod_picture,
                    ))),
            // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails())),
            child: GridTile(
              header: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () async {
                      Firestore.instance
                          .collection('favourite')
                          .document(prod_id)
                          .delete();
                      Fluttertoast.showToast(
                          msg: "Product Removed",
                          backgroundColor: Colors.red,
                          textColor: Colors.white);
                    }),
              ),
              footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "Rs $prod_price",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      subtitle: Text(
                        "Rs $prod_old_price",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                            decoration: TextDecoration.lineThrough),
                      ))),
              child: Image.network(prod_picture),
            )),
      ),
    ));
  }
}
