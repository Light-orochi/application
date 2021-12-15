import 'package:camdrives/cart/client_cart.dart';
import 'package:camdrives/constante.dart';
//import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/cart.dart';
import 'package:camdrives/provider/products.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'client_home.dart';

class ShowProducts extends StatelessWidget {
  static const routeName = "/product-details";
  final String id;
  ShowProducts({required this.id});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(id);
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
          child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 500,
              //autoPlay: true

              // autoPlay: false,
            ),
            items: imgList
                .map((item) => Stack(
                      children: [
                        Container(
                          height: 500,
                          child: Column(
                            children: [
                              Image.network(
                                loadedProduct.image,
                                fit: BoxFit.fill,
                                height: 450,
                              ),
                              Container(
                                height: 50,
                              )
                            ],
                          ),
                        ),
//            Container(
//              height: 200,
//             decoration: BoxDecoration(color: Colors.red),
//            ),

                        Container(
                          margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 30,
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.share_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),

                        Positioned(
                          bottom: 15,
                          right: 30,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            child: TextButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.turned_in_not_outlined,
                                color: authenticateBackground,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),

//          Container(
//              height: 200,
//             decoration: BoxDecoration(color: Colors.red),
//            ),
          buildRowTitle(loadedProduct.title),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    '${loadedProduct.price}  fr . ${loadedProduct.location}',
                    style: LocationStyle,
                  )),
            ],
          ),
          Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Divider(
                height: 30,
                thickness: 2,
              )),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    'About ${loadedProduct.title}',
                    style: ShowProductTitle,
                  )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(20),
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                        'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book ',
                        style: ShowProductsText,
                      ))),
            ],
          ),
          buildContainerlocation(
              Icons.location_on_outlined, 'LOCATION', 'SANTA LUCIA (DEIDO)'),
          SizedBox(
            height: 10,
          ),
          buildContainerlocation(
              Icons.store_mall_directory_outlined, 'CATEGORIE', 'SUPERMAKET'),
          SizedBox(
            height: 20,
          ),
          buildRowTitle('Autres categories '),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RowOtherCategory(
                icone: Icons.store_mall_directory_sharp,
                text: 'Boutiques',
              ),
              RowOtherCategory(
                icone: Icons.restaurant_outlined,
                text: 'Restaurant',
              ),
              RowOtherCategory(
                icone: Icons.add_business,
                text: 'Petits Business',
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 30,
            color: Colors.white,

          ),
          Container(

            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/new.png'),fit: BoxFit.cover
                )),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Position de la Boutique',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey.shade800),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.person_pin,
                            color: Colors.white,
                            size: 50,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                        )),
                    Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'SANTA LUCIA',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                            Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'SUPERMARKETS',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                )),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Deido derriere ecole publique bla bla bla bla derriere ecole publique ',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Column(
              children: [

                SizedBox(
                  height: 30,
                ),

                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          cart.addItemToCart(
                              loadedProduct.id,
                              loadedProduct.price,
                              loadedProduct.title,
                              loadedProduct.image);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('produits  a bien été ajouté panier '),
                              padding: EdgeInsets.all(5),
                              action: SnackBarAction(
                                label: 'Ouvrir le panier',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen()),
                                  );
                                },
                              )));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: authenticateBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            shadowColor: Colors.deepOrangeAccent,
                            ),
                        child: Text(
                          'Add to Cart',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Monstera',
                              fontSize: 15),
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class RowOtherCategory extends StatelessWidget {
  final IconData icone;
  final String text;
  const RowOtherCategory({
    Key? key,
    required this.icone,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Icon(
                icone,
                color: Colors.white,
                size: 25,
              ),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: authenticateBackground),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    ));
  }
}
