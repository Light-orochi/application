import 'package:camdrives/provider/Order.dart';
//import 'package:camdrives/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constante.dart';


class ClientProfil extends StatefulWidget {
  final GoogleSignInAccount client;
    ClientProfil({required this.client});

  @override
  _ClientProfilState createState() => _ClientProfilState();
}

class _ClientProfilState extends State<ClientProfil> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          backgroundColor: authenticateBackground,

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
        body:
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(

                color: authenticateBackground,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .40,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(width:150,height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),child: ClipRRect(borderRadius:BorderRadius.circular(50),child: Image.network('https://members-api.parliament.uk/api/Members/4066/Portrait?cropType=OneOne&webVersion=false',fit: BoxFit.fill,))),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('${widget.client.displayName}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text('Client',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey.shade300),),



                  ],
                ),
              ),

            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .32,
              left: 15,
              right: 15,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    height: 430,
                    child:
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: 
                      
                      DefaultTabController(

                          length: 2,
                          child: Column(
                            children: <Widget>[
                              Material(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),

                                  child: TabBar(
                                    indicatorColor:authenticateBackground,
                                    tabs: [
                                      Tab(child: Text('UTILISATEUR',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),),),
                                      Tab(child: Text('PAIMENT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700)),),

                                    ],
                                  )),
                              Expanded(
                                flex: 1,
                                child: TabBarView(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      decoration:BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: '698777078',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: '${widget.client.displayName}',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: '${widget.client.email}',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Rose',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Amadine',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Adresse',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),

                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                                                    height: 40,
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
                                                        'Add to Cart',
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
                                    Container(
                                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                                      decoration:BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Orange money',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Mtn Momo',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                                              child: TextField(
                                                decoration: InputDecoration(
                                                    border: UnderlineInputBorder(),
                                                    hintText: 'Carte Bancaire',
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: authenticateBackground,
                                                            width: 2))),
                                              )),




                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Container(
                                                    margin: EdgeInsets.fromLTRB(25, 20, 25, 0),
                                                    height: 40,
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
                                                        'Add to Cart',
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

                              ),
                            ],
                          )),
                    )
                ),
              ),
            ),
          ],
        )
    );
  }
}


//             Positioned(
//               child: Container(
//                 height: 300,
//                 decoration: BoxDecoration(color: authenticateBackground),
//                 child: Column(
//
//                   children: [
//                 Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(width:150,height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),child: ClipRRect(borderRadius:BorderRadius.circular(50),child: Image.network('https://members-api.parliament.uk/api/Members/4066/Portrait?cropType=OneOne&webVersion=false',fit: BoxFit.fill,))),
//                   ],
//                 ),
//                     SizedBox(height: 10,),
//                     Text('Rose amandine',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
//                     SizedBox(height: 10,),
//                     Text('Livreur',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey.shade300),),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -100,
//
//               child: Container(
//
//                 padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(50),
//                     color: Colors.green),
//                 child:Text('hello') ,
//               ),
//             ),


