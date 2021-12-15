import 'package:flutter/material.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(id:'1',title: 'Coca cola',image: 'https://www.coca-colamaroc.ma/content/dam/one/ma/fr/product-images/coca-cola-sans-sucres.png', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'2',title: 'Ice Cake (x3)',image: 'https://i.pinimg.com/236x/6b/91/d2/6b91d2bedf0d145a288eceb8c9300b16.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'3',title: 'Hamburger mix',image: 'https://www.mycake.fr/wp-content/uploads/2015/12/rs_cupcake_1x1.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'4',title: 'juice cocktail',image: 'https://www.acouplecooks.com/wp-content/uploads/2020/04/Tequila-Sunrise-003-735x919.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'5',title: 'Coca cola',image: 'https://www.coca-colamaroc.ma/content/dam/one/ma/fr/product-images/coca-cola-sans-sucres.png', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'6',title: 'Ice Cake (x3)',image: 'https://i.pinimg.com/236x/6b/91/d2/6b91d2bedf0d145a288eceb8c9300b16.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'7',title: 'Hamburger mix',image: 'https://www.mycake.fr/wp-content/uploads/2015/12/rs_cupcake_1x1.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),
    Product(id:'8',title: 'juice cocktail',image: 'https://www.acouplecooks.com/wp-content/uploads/2020/04/Tequila-Sunrise-003-735x919.jpg', price: 3000.0, location: 'Douala', quater:'Ange raphael'),];
  var _showFavouritesOnly=false;

  List<Product> get items{
    return [..._items];
  }

  Product findById(String id){
    return _items.firstWhere((element) => element.id==id);
  }
  void addProduct(){
    //_items.add(value);
    notifyListeners();
  }
  List<Product> get favoriteItems{
    return _items.where((prodItem)=>prodItem.isFavourite).toList();
  }
  }

