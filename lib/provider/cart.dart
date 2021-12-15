import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String image;
  final String title;
  final int quantity;
  final double price;
  CartItem(
      { required this.image,
        required this.id,
        required this.title,
        required this.quantity,
        required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items={};

  int get itemCount {
    return _items.length;
  }

  void removeItem(String productId){
    _items.remove((productId));
    notifyListeners();
  }

  Map<String, CartItem> get items {
    return {..._items};
  }
  double get totalAmount
  {
    var total=0.0;
    _items.forEach((key, cartItem) {
      total+=cartItem.price*cartItem.quantity;
    });
    return total;
  }



  void addItemToCart(String productId, double price, String title,String image) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
              (existingCartItem) => CartItem(
              id: existingCartItem.id,
              image: existingCartItem.image,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          productId,
              () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              image: image,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void clearCart(){
    _items={};
    notifyListeners();
  }
}

