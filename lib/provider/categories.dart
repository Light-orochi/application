import 'package:flutter/material.dart';

import 'category.dart';



class Categorie with ChangeNotifier {


  List<Category> _items = [
    Category(id: '1', title: 'Restaurant', image: 'images/icons/restaurants.png', quantity: 4000),
    Category(id: '2', title: 'Boutique', image: 'images/icons/shop.png', quantity: 2050),
    Category(id: '3', title: 'Supermarché', image: 'images/icons/super.jpg', quantity: 1050),
    Category(id: '4', title: 'Autres', image: 'images/icons/business.png', quantity: 6050),
  ];


  List<Category> get items{
    return [..._items];
  }

  Category findById(String id){
    return _items.firstWhere((element) => element.id==id);
  }
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }
  List<Category> get favoriteItems{
    return _items.where((prodItem)=>prodItem.isFavourite).toList();
  }
}
