import 'package:flutter/foundation.dart';
import 'package:a1_1_20/models/order.dart';
import '../models/cart.dart';

class OrderProvider with ChangeNotifier {
  final List<Order> _orderItem = [];

  List<Order> get orderItem {
    return [..._orderItem];
  }

  void addOrder(List<Cart> cartItems, double totalAmount) {
    _orderItem.insert(
        0,
        Order(
          id: DateTime.now().toString(),
          totalAmount: totalAmount,
          dateTime: DateTime.now(),
          orderItems: cartItems,
        ));
    notifyListeners();
  }
}
