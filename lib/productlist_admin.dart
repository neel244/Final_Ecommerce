import 'package:flutter/material.dart';
import 'product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // var product_list = [
  //   {
  //     "name": "Blazer",
  //     "picture": "images/blazer1.jpeg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "Red Dress",
  //     "picture": "images/red_dress.jpg",
  //     "old_price": 100,
  //     "price": 50
  //   },
  //   // {
  //   //   "name": "Dress",
  //   //   "picture": "images/dress2.jpeg",
  //   //   "old_price": 120,
  //   //   "new_price": 85
  //   // },

  //   // {
  //   //   "name": "Dress",
  //   //   "picture": "images/dress1.jpeg",
  //   //   "old_price": 120,
  //   //   "new_price": 85
  //   // },

  //   // {
  //   //   "name": "Heals",
  //   //   "picture": "images/hills2.jpeg",
  //   //   "old_price": 120,
  //   //   "new_price": 85
  //   // },

  //   {
  //     "name": "pants",
  //     "picture": "images/pants1.jpg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "pantwa",
  //     "picture": "images/pants2.jpeg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "blazer2",
  //     "picture": "images/blazer2.jpeg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "dress2",
  //     "picture": "images/dress2.jpeg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "heals",
  //     "picture": "images/hills2.jpeg",
  //     "old_price": 120,
  //     "price": 85
  //   },

  //   {
  //     "name": "shoe1",
  //     "picture": "images/shoe1.jpg",
  //     "old_price": 120,
  //     "price": 85
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Products Added by You"),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('productsell').snapshots(),
            builder: (context, snapshot) {
              return GridView.builder(
                  itemCount: snapshot.data.documents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot products = snapshot.data.documents[index];
                    return Single_prod(
                        prod_name: products['name'],
                        prod_picture: products['images'],
                        prod_old_price: products['quantity'],
                        // product_list[index]['quantity'].toString(),
                        prod_price: products['price']);
                    // product_list[index]['price'].toString());
                  });
            }));
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name,
      this.prod_picture,
      this.prod_old_price,
      this.prod_price});
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
                      product_detail_old_price: prod_old_price,
                      product_detail_picture: prod_picture,
                    ))),
            // Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new ProductDetails())),
            child: GridTile(
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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProductList extends StatefulWidget {
//   @override
//   _ProductListState createState() => _ProductListState();
// }

// class _ProductListState extends State<ProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[600],
//         title: Text(
//           "Products",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: Firestore.instance.collection('productsell').snapshots(),
//         builder: (context, snapshot) {
//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               DocumentSnapshot products = snapshot.data.documents[index];
//               return Padding(
//                   padding: const EdgeInsets.fromLTRB(0.0, 6, 0, 6),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border(bottom: BorderSide(color: Colors.black)),
//                     ),
//                     child: ListTile(
//                       leading: Container(
//                         height: 150,
//                         child: Image.network(
//                           products['images'],
//                           height: 150,
//                           width: 70,
//                         ),
//                       ),
//                       title: Text(products['name']),
//                       subtitle: Text(products['price'].toString()),
//                     ),
//                   ));
//             },
//           );
//         },
//       ),
//     );
//   }
// }
