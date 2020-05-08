import 'package:flutter/material.dart';
import '../providers/CartModel.dart';

class Cart with ChangeNotifier {
  Map<String, CartModel> _items ={};

  Map<String, CartModel> get getItems {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartModel(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartModel(
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
  
  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
}
