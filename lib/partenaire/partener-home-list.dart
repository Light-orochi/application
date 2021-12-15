import 'package:camdrives/constante.dart';
import 'package:camdrives/livreur/deliver-details.dart';
import 'package:camdrives/partenaire/partner-order.dart';
import 'package:camdrives/provider/Order.dart';
//import 'package:camdrives/widgets/client-drawer.dart';
import 'package:camdrives/widgets/deliver-drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyPartnerHomeList extends StatefulWidget {
  @override
  _MyPartnerHomeListState createState() => _MyPartnerHomeListState();
}

class _MyPartnerHomeListState extends State<MyPartnerHomeList> {
  @override
  Widget build(BuildContext context) {
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
          'Accueil',
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
                                'COMMANDES DISPONIBLES' ,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Expanded(flex:1,child: Icon(Icons.grid_view,color: Colors.grey.shade600,)),
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
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [Container(

                            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                            decoration: BoxDecoration(border: Border(bottom:BorderSide(color:Colors.grey.shade400,width: 1.0,style: BorderStyle.solid ))),
                            child: Row(
                              children: [
                                Expanded( flex: 3,child: Text('ORDER ID',style: prodList),),
                                Expanded( flex: 2,child: Text('PRICE',style: prodList),),
                                Expanded( flex: 2,child: Text('QTY',style: prodList),),
                                Expanded( flex: 2,child: Text('STATUS',style:prodList),),
                                Expanded( flex: 2,child: Text('ACTION',style: prodList),),


                              ],
                            ),
                          ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount:orderData.orders.length,itemBuilder:(context,index)=>
                                Container(
                                  decoration: BoxDecoration(border: Border(bottom:BorderSide(color:Colors.grey.shade400,width: 1.0,style: BorderStyle.solid ))),

                                  child: Row(
                                    children: [
                                      Expanded(flex:3,child: Text(orderData.orders[index].id,style: prodList,)),
                                      Expanded(flex:2,child: Text('${orderData.orders[index].amount} FR',style: prodList)),
                                      Expanded(flex:2,child: Text('2',style: prodList)),
                                      Expanded(flex:2,child: Text( 'en Cours',style: CartStyles)),
                                      Expanded(flex:2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [


                                              Expanded(child: Container(decoration:BoxDecoration(shape: BoxShape.circle,color: Colors.green.shade600),child: Icon(Icons.remove_red_eye,size: 20,))),
                                              Expanded(child: Icon(Icons.block,size: 20,)),

                                            ],)),

                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 30,),


                          ],
                        ),
                      ),
                    ),
                  ],

                ),

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
