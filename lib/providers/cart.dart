import 'package:flutter/material.dart';
import '../providers/CartModel.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items ={};

  Map<String, CartItem> get getItems {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total+=cartItem.price * cartItem.quantity;
    });
    return total;
  }
}
