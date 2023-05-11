import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: "p1",
      productName: "BERDAMAI DENGAN RASA MALAS",
      price: 15600,
      imageUrl:
          "https://down-id.img.susercontent.com/file/9cb1c75e46b613f6ac41fd7173cc59df",
    ),
    Product(
      id: "p2",
      productName: "DIAMOND GANG THE MISSION",
      price: 13000,
      imageUrl:
          "https://down-id.img.susercontent.com/file/sg-11134201-22100-g65lfa2tfuivf7",
    ),
    Product(
      id: "p3",
      productName: "Bumi dan Lukanya",
      price: 15600,
      imageUrl:
          "https://down-id.img.susercontent.com/file/3bcdfcfde45a9c6cb4268d37e4ea35c5",
    ),
    Product(
      id: "p4",
      productName: "Garis Waktu",
      price: 14000,
      imageUrl:
          "https://down-id.img.susercontent.com/file/sg-11134201-22100-xx01h1ug7siv3b",
    ),
    Product(
      id: "p5",
      productName: "Teluk Alaska",
      price: 18200,
      imageUrl:
          "https://down-id.img.susercontent.com/file/a3e8648a9f7a90d457cf17ebaa4f267f",
    ),
    Product(
      id: "p6",
      productName: "Silhoutte",
      price: 15600,
      imageUrl:
          "https://down-id.img.susercontent.com/file/6441d48196a4af1293a618ce3b137430",
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) {
      return prod.id == id;
    });
  }

  void removeProduct(String productId) {
    _items.removeWhere((item) => item.id == productId);
    notifyListeners();
  }

  void add(Product newProduct) {
    _items.insert(0, newProduct);
    notifyListeners();
  }
}
