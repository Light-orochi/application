import 'package:camdrives/provider/Order.dart';
//import 'package:camdrives/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

class RateScreen extends StatefulWidget {


  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade300,
      appBar:  AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,

        leading: ClipOval(
          child: TextButton(

            onPressed: () {
              Navigator.pop(context);
//            Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.close,
                color: ClientAppBarColor, size: 20),
          ),
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

        title: Text(
          'Avis',
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
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(margin:EdgeInsets.fromLTRB(20, 0, 0, 0),child: ClipRRect(  borderRadius:BorderRadius.circular(20),child: Image.network('https://randomuser.me/api/portraits/med/men/75.jpg',height: 60,width: 50,fit: BoxFit.cover,)))),
                Expanded(flex:4,child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                        Row(
                          children: [
                            Text('1 HOUR AGO',style: TextStyle(color: Colors.grey.shade500,fontSize: 12,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Row(

                          children: [
                            Expanded(
                              child: RichText(

                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "NJIFANDA ERIC ",style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold)
                                    ),

                                    TextSpan(
                                      text: " A ajouté un avis sur vous ",style: TextStyle(color: Colors.grey,fontSize: 11)
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),


                    ],
                  ),
                ))
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(height: 150, child: VerticalDivider(color: Colors.grey))),
                Expanded(flex:4,child: Column(
                  children: [

                    SizedBox(height: 5,),
                    Container(


                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),padding: EdgeInsets.all(30),margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Column(
                        children: [
                          Row(children: [Text('Tres bon service',style: TextStyle(fontWeight: FontWeight.bold),)]),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500,),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                            ],
                          ),
                          Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 20,thickness: 2,)),
                          Row(
                            children: [
                              Expanded(child: Text('j\' ai bien recu le produit il etait en parfait etat et je suis hereu',
                                style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),))
                            ],
                          ),












                        ],

                      ),
                    ),
                    Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 50,thickness: 2,)),

                  ],
                ))
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(margin:EdgeInsets.fromLTRB(20, 0, 0, 0),child: ClipRRect(  borderRadius:BorderRadius.circular(20),child: Image.network('https://randomuser.me/api/portraits/med/men/75.jpg',height: 60,width: 50,fit: BoxFit.cover,)))),
                Expanded(flex:4,child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('1 HOUR AGO',style: TextStyle(color: Colors.grey.shade500,fontSize: 12,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(

                        children: [
                          Expanded(
                            child: RichText(

                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "NJIFANDA ERIC ",style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold)
                                  ),

                                  TextSpan(
                                      text: " A ajouté un avis sur vous ",style: TextStyle(color: Colors.grey,fontSize: 11)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ))
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(height: 150, child: VerticalDivider(color: Colors.grey))),
                Expanded(flex:4,child: Column(
                  children: [

                    SizedBox(height: 5,),
                    Container(


                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),padding: EdgeInsets.all(30),margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Column(
                        children: [
                          Row(children: [Text('Tres bon service',style: TextStyle(fontWeight: FontWeight.bold),)]),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500,),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                            ],
                          ),
                          Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 20,thickness: 2,)),
                          Row(
                            children: [
                              Expanded(child: Text('j\' ai bien recu le produit il etait en parfait etat et je suis hereu',
                                style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),))
                            ],
                          ),












                        ],

                      ),
                    ),
                    Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 50,thickness: 2,)),

                  ],
                ))
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(margin:EdgeInsets.fromLTRB(20, 0, 0, 0),child: ClipRRect(  borderRadius:BorderRadius.circular(20),child: Image.network('https://randomuser.me/api/portraits/med/men/75.jpg',height: 60,width: 50,fit: BoxFit.cover,)))),
                Expanded(flex:4,child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('1 HOUR AGO',style: TextStyle(color: Colors.grey.shade500,fontSize: 12,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(

                        children: [
                          Expanded(
                            child: RichText(

                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "NJIFANDA ERIC ",style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.bold)
                                  ),

                                  TextSpan(
                                      text: " A ajouté un avis sur vous ",style: TextStyle(color: Colors.grey,fontSize: 11)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),


                    ],
                  ),
                ))
              ],

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(flex:1,child: Container(height: 150, child: VerticalDivider(color: Colors.grey))),
                Expanded(flex:4,child: Column(
                  children: [

                    SizedBox(height: 5,),
                    Container(


                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),padding: EdgeInsets.all(30),margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Column(
                        children: [
                          Row(children: [Text('Tres bon service',style: TextStyle(fontWeight: FontWeight.bold),)]),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500,),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                              Icon(Icons.star_border,size: 15,color: Colors.orange.shade500),
                            ],
                          ),
                          Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 20,thickness: 2,)),
                          Row(
                            children: [
                              Expanded(child: Text('j\' ai bien recu le produit il etait en parfait etat et je suis hereu',
                                style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold),))
                            ],
                          ),












                        ],

                      ),
                    ),
                    Container(margin:EdgeInsets.fromLTRB(20, 0,20, 0),child: Divider(height: 50,thickness: 2,)),

                  ],
                ))
              ],

            ),








          ],
        ),
      ),

    );
  }
}


