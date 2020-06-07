import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'finalpage.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int total = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Shopping Cart",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('cart').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Scaffold(
                body: Center(
                    child: Text(
                  'No items in the cart',
                  style: TextStyle(color: Colors.grey),
                )),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot products = snapshot.data.documents[index];
                  String prodid = products['id'];
                  return Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 6, 0, 6),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.black)),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 150,
                            child: Image.network(
                              products['images'],
                              height: 150,
                              width: 70,
                            ),
                          ),
                          title: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(products['name']),
                              ),
                              Expanded(
                                  child: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: null,
                              ))
                            ],
                          ),
                          subtitle: Text(
                            products['price'].toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ));
                },
              );
            }
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              // Expanded(
              //     child: ListTile(
              //   title: Text("Total"),
              //   subtitle: Text("230"),
              // )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FinalPage()));
                  Firestore.instance
                      .collection('cart')
                      .getDocuments()
                      .then((snapshot) {
                    for (DocumentSnapshot ds in snapshot.documents) {
                      ds.reference.delete();
                    }
                  });
                },
                color: Colors.red,
                child: Text("Checkout"),
                textColor: Colors.white,
              ))
            ],
          ),
        ));
  }
}
