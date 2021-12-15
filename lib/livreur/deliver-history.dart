import 'package:camdrives/constante.dart';
import 'package:camdrives/provider/Order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'deliver-details.dart';

class MyDeliverHistory extends StatefulWidget {
  @override
  _MyDeliverHistoryState createState() => _MyDeliverHistoryState();
}

class _MyDeliverHistoryState extends State<MyDeliverHistory> {
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: TextButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
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
          'Historique de commande',
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
      Column(
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
                            Text(
                              'COMMANDES ACCEPTES',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
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
                  itemCount: orderData.orders.length,
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
                                child: Image.network('https://media.istockphoto.com/vectors/vector-shopping-bag-icon-vector-id521788585?b=1&k=20&m=521788585&s=170667a&w=0&h=_QgDht6-9r4-pALpaAz-4mpf3nk0RN8PkNhP5sfqyiA=',fit: BoxFit.fill,),
                              )],
                            )),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(children: [
                                  Expanded(
                                    flex: 5,
                                      child: Text(
                                        'Order ${orderData.orders[index].id}',
                                        style: CartStyles,
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: PopupMenuButton(


                                      icon: Icon(Icons.more_vert_outlined),
                                        itemBuilder:(context)=>[
                                          PopupMenuItem( child: Text('Livré',style: popMenuItem,),
                                            value:'livre' ,height: 30, ),
                                          PopupMenuItem(child: Text('En cours',style: popMenuItem),
                                              value:'en cours',height: 30,),
                                          PopupMenuItem(child: Text('Non livré',style: popMenuItem),
                                              value:'non livre',height: 30,),
                                        ]
                                    ),
                                  ),

                                ]),
                                SizedBox(height: 10,),
                                Row(children: [
                                  Expanded(flex:3,

                                      child: Text(
                                        ' ${orderData.orders[index].amount} FR',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600),
                                      )),
                                  Expanded(flex:1,child:Container(decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),child: Text('En cours',style: TextStyle(fontSize: 10,color: Colors.white),textAlign:TextAlign.center,),))
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
                                            height: 30,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => OrderDetails(orderData: orderData.orders[index])),
                                                );

                                              },
                                              style: TextButton.styleFrom(
                                                  backgroundColor: authenticateBackground,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(24.0),
                                                  ),
                                                  shadowColor: Colors.deepOrangeAccent),
                                              child: Text(
                                                'Voir le contenu',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color:Colors.white, fontFamily: 'Monstera', fontSize: 10),
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
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
