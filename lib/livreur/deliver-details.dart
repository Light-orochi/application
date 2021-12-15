import 'package:camdrives/provider/Order.dart';
//import 'package:camdrives/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

class OrderDetails extends StatefulWidget {
  final OrderItem orderData;

  OrderDetails({required this.orderData,});

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: TextButton(
          onPressed: () {
              Navigator.pop(context);
//            Scaffold.of(context).openDrawer();
          },
          child: Icon(Icons.arrow_back,
              color: ClientAppBarColor, size: ClientAppBarSize),
        ),

//        actions: [
//          Row(
//            children: [
//              Icon(
//                Icons.notifications_none_outlined,
//                color: ClientAppBarColor,
//                size: ClientAppBarSize,
//              ),
//              SizedBox(
//                width: 20,
//              ),
//              Icon(Icons.search_outlined,
//                  color: ClientAppBarColor, size: ClientAppBarSize)
//            ],
//          )
//        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,

//        title: Text(
//          'Accueil',
//          style: clientTitleStyle,
//        ),

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
      body:SingleChildScrollView(
        child: Column(
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
                                child: Text(
                                  'COMMANDES N° ${widget.orderData.id}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text('${widget.orderData.amount} fr . Deido',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(mainAxisAlignment:MainAxisAlignment.end,children: [Text('Contenu de la commande',style: CartStyle,)],)

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
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.orderData.products.length,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(20, 10, 20 ,10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.network(widget.orderData.products[index].image,height: 100,),
                                )],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Expanded(
                                        child: Text(
                                          'Order ${widget.orderData.products[index].title}',
                                          style: CartStyles,
                                        ))
                                  ]),
                                  SizedBox(height: 10,),
                                  Row(children: [
                                    Expanded(
                                        child: Text(
                                          ' ${widget.orderData.products[index].price} FR',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                                        ))
                                  ]),
                                  SizedBox(height: 15,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(flex: 1,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [

                                                  WidgetSpan(
                                                    child: Icon(Icons.location_on_outlined, size: 15,color: Colors.grey,),
                                                  ),
                                                  TextSpan(
                                                    text: "deido",style: TextStyle(color: Colors.grey),
                                                  ),
                                                ],
                                              ),
                                            )),

                                        Expanded(flex: 2,
                                            child:  Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              height: 25,
                                              child: TextButton(
                                                onPressed: () {
//                                                Navigator.push(
//                                                  context,
//                                                  MaterialPageRoute(builder: (context) => OrderDetails(products: OrderData.orders[index].products,)),
//                                                );

                                                },
                                                style: TextButton.styleFrom(
                                                    backgroundColor: authenticateBackground,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(24.0),
                                                    ),
                                                    shadowColor: Colors.deepOrangeAccent),
                                                child: Text(
                                                  'Voir le produit',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:Colors.white, fontFamily: 'Monstera', fontSize: 9),
                                                ),
                                              ),
                                            )
                                        ),

                                      ]),
                                  SizedBox(height: 10,),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
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
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [

                        Row(
                          children: [
                            Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                  height: 50,
                                  child: TextButton(
                                    onPressed: () {

                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: authenticateBackground,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(24.0),
                                        ),
                                        shadowColor: Colors.deepOrangeAccent,
                                       ),
                                    child: Text(
                                      'Accepter la commande',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:Colors.white, fontFamily: 'Monstera', fontSize: 15),
                                    ),
                                  ),
                                ))
                          ],
                        )


                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


