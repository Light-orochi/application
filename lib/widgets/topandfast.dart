import 'package:camdrives/client/client_home.dart';
import 'package:camdrives/client/client_show_product.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/product.dart';
import 'package:camdrives/provider/products.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constante.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class TopAndFast extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
final productsData=Provider.of<Products>(context);
final products =  productsData.items;

    return Swiper(

      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(

          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ) ,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(flex:4,child: Image.network(products[index].image,fit: BoxFit.cover,height: 150,)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex:4,child: Container(margin:EdgeInsets.fromLTRB(15, 0, 0, 10)
                    ,child: Text(products[index].title,maxLines: 1 ,style: ProductStyle))),
                Expanded(flex:1,child: Icon(Icons.more_vert_outlined,size: 15,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('${products[index].price} fr',style:TextStyle(decoration: TextDecoration.lineThrough,fontSize: 11),),
                      Text('${products[index].price-300} fr',style:PriceStyle,),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                          children:[
                            Icon(Icons.location_on_outlined,size: 30,color: Colors.grey.shade500,),
                          ]
                      ),
                      LocationAndQuater(products , index),
                    ],
                  ),
                ),
              ],
            )


          ],
        ),);
      },
      autoplay: true,
      viewportFraction: 0.6,
      scale: 0.75,


    );
  }
}
