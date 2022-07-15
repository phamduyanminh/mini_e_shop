import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorited;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorited = false,
  });

  void tonggleFavoriteStatus() {
    isFavorited = !isFavorited;
    print("Status: $isFavorited");
    notifyListeners();
  }
}
