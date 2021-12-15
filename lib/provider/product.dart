import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final  String title;
  final String image;
  final double price;
  final String location;
  final String quater;
  bool isFavourite;

  Product( {
    required  this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.location,
    required this.quater,
    this.isFavourite=false
  });

  void
  toggleFAvouriteStatus(){
    isFavourite=!isFavourite;
    notifyListeners();
  }



// bool isFavourite;

  /*Product({required this.id,required this.title,required this.description,required this.price,required this.imageUrl, this.isFavourite=false});

  void toggleFAvouriteStatus(){
    isFavourite=!isFavourite;
    notifyListeners();
  }*/

}