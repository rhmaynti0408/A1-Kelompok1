import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id;
  String productName;
  double price;
  String imageUrl;

  Product(
      {required this.id,
      required this.productName,
      required this.price,
      required this.imageUrl});
}
 