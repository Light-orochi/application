import 'package:camdrives/client/client_show_product.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/product.dart';
import 'package:camdrives/provider/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constante.dart';
class ProductItem extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context,listen: false);
    final products = productsData.items;
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),

      itemBuilder: (context,index)=>ChangeNotifierProvider.value(
        value: products[index],
        child: Column(
          children: [
            Container(
              height: 150,
              width:MediaQuery.of(context).size.width,

              margin: EdgeInsets.fromLTRB(10,5,10,5),
              decoration: BoxDecoration(color: CupertinoColors.white,borderRadius: BorderRadius.circular(15)),
              child:
              Row(
                children: [
                  Expanded(flex:1,child: ClipRRect(borderRadius: BorderRadius.only(topLeft:Radius.circular(13),bottomLeft:Radius.circular(13) ),child: Image.network(products[index].image,height: 130,fit: BoxFit.fill,))),
                  Expanded(flex:2,child:Container(
                    margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Column(
                      children: [
                        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [Text(products[index].title,maxLines: 1 ,style: ProductStyle,),
//                                      DropdownButton(
//                                        icon: Icon(
//                                        Icons.more_vert_outlined,
//                                    ), items: [
//
//                                      ],
//                                      ),
                          PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text(
                                    "Ajouter au panier",
                                    style: LocationStyle
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text(
                                    "Ajouter au favoris",
                                    style: LocationStyle
                                ),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Text(
                                    "Ajouter un avis",
                                    style:  LocationStyle
                                ),
                              ),
                            ],
                            icon: Icon(Icons.more_vert_outlined,size: 15,),
                            offset: Offset(0, 20),
                          )


                        ]),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('${products[index].price} Fr',style: PriceStyle,),
                          ],
                        ),
                        SizedBox(height: 20,),

                        Row(


                          children: [

                            Column(
                                children:[
                                  Icon(Icons.location_on_outlined,size: 30,color: Colors.grey.shade500,),
                                ]
                            ),
                            Expanded(
                              child: LocationAndQuater(products, index),
                            )
                            ,
                            SizedBox(
                                height: 30,
                                child: TextButton(onPressed: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowProducts(id:products[index].id)));

                                }, child: Row(
                                  children: [
                                    Text(
                                      ' Details',
                                      style: TextStyle(
                                          color:Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 12),
                                    ),
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      color: CupertinoColors.white,
                                      size: 12,
                                    )
                                  ],
                                ),style:TextButton.styleFrom(
                                  backgroundColor:
                                  authenticateBackground,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(24.0),
                                  ),
                                ),
                                )
                            )
                          ],)
                      ],


                    ),
                  ) )

                ],

              ),
            ),
          ],
        ),
      )


    );
  }


}

