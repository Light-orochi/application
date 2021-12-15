
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/Order.dart';
//import 'package:camdrives/provider/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constante.dart';

class PartnerData extends StatefulWidget {


  @override
  _PartnerDataState createState() => _PartnerDataState();
}

class _PartnerDataState extends State<PartnerData> {


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
                height: MediaQuery.of(context).size.height * .32,
                child:
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width:150,height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),color: Colors.red),child: ClipRRect(borderRadius:BorderRadius.circular(50),child: Image.network('https://members-api.parliament.uk/api/Members/4066/Portrait?cropType=OneOne&webVersion=false',fit: BoxFit.fill,))),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text('Rose amandine',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    SizedBox(height: 10,),
                    Text('Partner',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey.shade300),),



                  ],
                ),
              ),

            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .28,
              left: 15,
              right: 15,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                    width: MediaQuery.of(context).size.height * .90,
                    height: 70,
                    child:
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Expanded(child: Column(
                           children: [
                             Text('18',style: CartStyles,),
                             Text('commandes en cours',style: dataStyle,textAlign: TextAlign.center,)
                           ],
                         )),
                          Expanded(child: Column(
                            children: [
                              Text('30',style: CartStyles,),
                              Text('commandes livrés',style:dataStyle,textAlign: TextAlign.center)
                            ],
                          )),
                          Expanded(child: Column(
                            children: [
                              Text('48',style: CartStyles,),
                              Text('Nombre de produits ',style: dataStyle,textAlign: TextAlign.center)
                            ],
                          )),

                        ],
                      ),
                    )
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .40,
              left: 15,
              right: 15,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: buildContainerlocation(Icons.location_on_outlined,'DOUALA','Deido')),


                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [Expanded(child: buildContainerlocation(Icons.store_mall_directory_outlined,'VENTES','300 000 fr'),)],
                    ),SizedBox(height: 10,),
                    Row(
                      children: [Expanded(child: buildContainerlocation(Icons.store_mall_directory_outlined,'CATEGORIE','SUPERMAKET'),)],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [Expanded(child: buildContainerlocation(Icons.store_mall_directory_outlined,'STATISTIQUES','Votre progression'),)],
                    )
                  ],
                ),
              ),
            )


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


