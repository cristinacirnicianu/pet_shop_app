import 'package:flutter/material.dart';
import 'package:petshopapp/providers/CartItem.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

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
  }
}
