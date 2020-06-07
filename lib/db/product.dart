import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'productsell';

  void uploadProduct(
      {String productName,
      String brand,
      String category,
      int quantity,
      List sizes,
      String images,
      double price}) {
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'id': productId,
      'brand': brand,
      'category': category,
      'quantity': quantity,
      'sizes': sizes,
      'images': images,
      'price': price
    });
  }

  void uploadToCart({
    String productName,
    String brand,
    String category,
    int quantity,
    String images,
    double price,
  }) {
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection('cart').document(productId).setData({
      'name': productName,
      'id': productId,
      'brand': brand,
      'category': category,
      'quantity': quantity,
      'images': images,
      'price': price
    });
  }

  void uploadToFav({
    String productName,
    String brand,
    String category,
    int quantity,
    String images,
    double price,
  }) {
    var id = Uuid();
    String productId = id.v1();
    _firestore.collection('favourite').document(productId).setData({
      'name': productName,
      'id': productId,
      'brand': brand,
      'category': category,
      'quantity': quantity,
      'images': images,
      'price': price
    });
  }
}
