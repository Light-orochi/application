import 'package:flutter/material.dart';

class Category with ChangeNotifier {
  final String id;
  final  String title;
  final String image;
  final int quantity;
  bool isFavourite;

  Category( {
    required  this.id,
    required this.title,
    required this.image,
    required this.quantity,

    this.isFavourite=false
  });

  void  toggleFAvouriteStatus(){
    isFavourite=!isFavourite;
    notifyListeners();
  }



}

