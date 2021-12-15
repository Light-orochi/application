import 'package:camdrives/client/client_show_product.dart';
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/livreur/deliver-details.dart';
import 'package:camdrives/partenaire/partner-order.dart';
import 'package:camdrives/provider/Order.dart';
import 'package:camdrives/provider/products.dart';
//import 'package:camdrives/widgets/client-drawer.dart';
import 'package:camdrives/widgets/deliver-drawer.dart';
import 'package:camdrives/widgets/product-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyPartnerProduct extends StatefulWidget {
  @override
  _MyPartnerProductState createState() => _MyPartnerProductState();
}

class _MyPartnerProductState extends State<MyPartnerProduct> {
  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context,listen: false);
    final products = productsData.items;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawerDeliver(),
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: TextButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(Icons.sort_outlined,
              color: ClientAppBarColor, size: ClientAppBarSize),
        ),

        actions: [
          Row(
            children: [
              Icon(
                Icons.notifications_none_outlined,
                color: ClientAppBarColor,
                size: ClientAppBarSize,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.search_outlined,
                  color: ClientAppBarColor, size: ClientAppBarSize)
            ],
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,

        title: Text(
          'Produits',
          style: clientTitleStyle,
        ),

//        bottom: TabBar(
//          tabs: [
//            Tab(
//              child: Text(
//                'Disoponible',
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ),
//            Tab(
//              child: Text(
//                'Favoris',
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//            ),
//          ],
//
//
//          indicator: UnderlineTabIndicator(
//              borderSide: BorderSide(color: Colors.red,width: 3)),
//          unselectedLabelColor: Color(0xFFc2c2c1),
//          labelColor: Color(0xFF4d4d4d),
//        ),
      ),

      body:
      ListView(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                'PRODUITS' ,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(flex:1,child: Icon(Icons.list,color: Colors.grey.shade600,)),
                          ],
                        ),

                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: authenticateBackground,
                                width: 3.0,
                                style: BorderStyle.solid))),
                  )),
            ],
          ),
          ListView.builder(
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
                                        height: 20,
                                        child: Text(
                                            "Ajouter au panier",
                                            style: LocationStyle
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        height: 20,
                                        child: Text(
                                            "Ajouter au favoris",
                                            style: LocationStyle
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 3,
                                        height: 20,
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
                                          Icon(Icons.check_box_rounded,size: 20,color: Colors.green.shade600,),
                                        ]
                                    ),
                                    Expanded(
                                      child: Text('Disponible',style: TextStyle(color: Colors.green.shade600,fontWeight: FontWeight.bold,),
                                    ))
                                    ,
                                    SizedBox(
                                        height: 25,
                                        child: TextButton(onPressed: () {
                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ShowProducts(id:products[index].id)));

                                        }, child: Row(
                                          children: [
                                            Text(
                                              ' Details',
                                              style: TextStyle(
                                                  color:Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 8),
                                            ),
                                            Icon(
                                              Icons.chevron_right_outlined,
                                              color: CupertinoColors.white,
                                              size: 10,
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


          )

        ],
      ),
    );
  }
}
