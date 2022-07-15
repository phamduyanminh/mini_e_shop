import 'package:flutter/material.dart';

import '../model/cart.dart';

class CartProvider extends ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String productID, double price, String title) {
    if (items.containsKey(productID)) {
      _items.update(
        productID,
        (existingCardItem) => Cart(
          id: existingCardItem.id,
          title: existingCardItem.title,
          quantity: existingCardItem.quantity + 1,
          price: existingCardItem.price,
        ),
      );
    } else {
      _items.putIfAbsent(
        productID,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          quantity: 1,
          price: price,
        ),
      );
    }
    notifyListeners();
  }
}
