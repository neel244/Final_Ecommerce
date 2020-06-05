import 'main.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
            child: Text("FashApp"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            height: 350,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: FittedBox(
                    child: Image.network(widget.product_detail_picture),
                    // fit: BoxFit.fill,
                  )),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  // leading: new Text(
                  //   widget.product_detail_name,
                  //   style:
                  //       TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  // ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.product_detail_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        "${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: Text(
                        "${widget.product_detail_new_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              //--------------1st button -----------------
              Expanded(
                  child: MaterialButton(
                elevation: 0.5,
                height: 50,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("Size"),
                          content: Text('Choose your size'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Size")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle))
                  ],
                ),
              )),

              Expanded(
                  child: MaterialButton(
                elevation: 0.5,
                height: 50,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("Color"),
                          content: Text('Choose your color'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Color")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle))
                  ],
                ),
              )),

              Expanded(
                  child: MaterialButton(
                elevation: 0.5,
                height: 50,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("Quantity"),
                          content: Text('Choose your Quantity'),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Qty")),
                    Expanded(child: Icon(Icons.arrow_drop_down_circle))
                  ],
                ),
              ))
            ],
          ),
          Row(
            children: <Widget>[
              //--------------Buy button -----------------
              Expanded(
                  child: MaterialButton(
                elevation: 0.5,
                height: 50,
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Buy Now",
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              )),
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.red,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {})
            ],
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Name',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Brand',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("Brand X"),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  'Product Condition',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("NEW"),
              )
            ],
          )
          //Similar products setion
          ,
          Divider(),
          Text("Similar Products"),
          Container(
            height: 360,
            child: Simliar_products(),
          )
        ],
      ),
    );
  }
}

class Simliar_products extends StatefulWidget {
  @override
  _Simliar_productsState createState() => _Simliar_productsState();
}

class _Simliar_productsState extends State<Simliar_products> {
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/blazer1.jpeg",
      "old_price": 120,
      "price": 85
    },

    {
      "name": "Red Dress",
      "picture": "images/red_dress.jpg",
      "old_price": 100,
      "price": 50
    },
    // {
    //   "name": "Dress",
    //   "picture": "images/dress2.jpeg",
    //   "old_price": 120,
    //   "new_price": 85
    // },

    // {
    //   "name": "Dress",
    //   "picture": "images/dress1.jpeg",
    //   "old_price": 120,
    //   "new_price": 85
    // },

    // {
    //   "name": "Heals",
    //   "picture": "images/hills2.jpeg",
    //   "old_price": 120,
    //   "new_price": 85
    // },

    {
      "name": "pants",
      "picture": "images/pants1.jpg",
      "old_price": 120,
      "price": 85
    },

    {
      "name": "pantwa",
      "picture": "images/pants2.jpeg",
      "old_price": 120,
      "price": 85
    },

    {
      "name": "blazer2",
      "picture": "images/blazer2.jpeg",
      "old_price": 120,
      "price": 85
    },

    // {
    //   "name": "dress2",
    //   "picture": "images/dress2.jpeg",
    //   "old_price": 120,
    //   "price": 85
    // },

    // {
    //   "name": "heals",
    //   "picture": "images/hills2.jpeg",
    //   "old_price": 120,
    //   "price": 85
    // },

    // {
    //   "name": "shoe1",
    //   "picture": "images/shoe1.jpg",
    //   "old_price": 120,
    //   "price": 85
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price']);
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod(
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
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              ),
            )),
      ),
    ));
  }
}
