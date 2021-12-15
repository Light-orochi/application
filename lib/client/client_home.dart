import 'package:camdrives/cart/client_cart.dart';
import 'package:camdrives/client/client_category.dart';
import 'package:camdrives/client/profil-client.dart';
import 'package:camdrives/livreur/deliver-data.dart';
import 'package:camdrives/livreur/deliver-history.dart';
import 'package:camdrives/livreur/deliver-profil.dart';
import 'package:camdrives/partenaire/partener-data.dart';
import 'package:camdrives/partenaire/partener-home-list.dart';
import 'package:camdrives/partenaire/partner-home.dart';
import 'package:camdrives/partenaire/partner-product-list.dart';
import 'package:camdrives/partenaire/partner-products.dart';
import 'package:camdrives/partenaire/partner-profil.dart';
import 'package:camdrives/screen/client-rate.dart';
import 'package:camdrives/screen/register-type.dart';
import '../livreur/deliver-home.dart';
//import 'package:camdrives/client/client_show_product.dart';
import 'package:camdrives/client/filter_client.dart';
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/widgets/client-drawer.dart';
//import 'package:camdrives/provider/product.dart';
//import 'package:camdrives/provider/products.dart';
//import 'package:camdrives/screen/login.dart';
import 'package:camdrives/widgets/product-item.dart';
import 'package:camdrives/widgets/topandfast.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import 'package:provider/provider.dart';


final List<String> category = [
  'Shop',
  'Restaurant',
  'Supermarkt',
  'Small',
  'Mini market',
  'Shop',
  'Restaurant',
  'Supermarkt',
  'Small',
  'Mini market'
];

final List<String> imgList = [

  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class MyClientHome extends StatefulWidget {


  @override
  _MyClientHomeState createState() => _MyClientHomeState();
}

class _MyClientHomeState extends State<MyClientHome> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ScaffoldWithTab(),
    CartScreen(),
    MyDeliverHome(),
    RateScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: ClientScafoldColor,
      drawer: MyDrawer(),
      body:IndexedStack(children: _widgetOptions,index: _selectedIndex,),
      bottomNavigationBar: buildBottomNavigationBar(),




    );


  }
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined,size: 40),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.delivery_dining,size: 40
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle,size: 40),
          label: '',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:authenticateBackground,
      onTap: (index){
        _onItemTapped(index);

      },
    );
  }
}
 class ScaffoldWithTab extends StatefulWidget {
  const ScaffoldWithTab();
   @override
   _ScaffoldWithTabState createState() => _ScaffoldWithTabState();
 }

 class _ScaffoldWithTabState extends State<ScaffoldWithTab> {
   @override
   Widget build(BuildContext context) {

     return
       DefaultTabController(
         length: 2,
         child: Scaffold(
           drawer: MyDrawer(),
           appBar: AppBar(

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
             elevation: 0.0,
             title: Text(
               'Accueil',
               style: clientTitleStyle,
             ),
             bottom: TabBar(
               tabs: [
                 Tab(
                   child: Text(
                     'Disoponible',
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                 ),
                 Tab(
                   child: Text(
                     'Favoris',
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                 ),
               ],


               indicator: UnderlineTabIndicator(
                   borderSide: BorderSide(color: Colors.red,width: 3)),
               unselectedLabelColor: Color(0xFFc2c2c1),
               labelColor: Color(0xFF4d4d4d),
             ),

           ),
           body: TabBarView(
             children: <Widget>[
               Center(child:Available() ),
               Center(child: Text('hello'),),

             ],
           ),
         ),
       );
   }
 }



class Available extends StatefulWidget {


  @override
  _AvailableState createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
//  var _showOnlyFavourite = false;
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          SizedBox(
            height: 2,
          ),
          CarouselSlider(

            options: CarouselOptions(
              viewportFraction: 1.0,
              height: 320,
              //autoPlay: true

              // autoPlay: false,
            ),
            items: imgList
                .map((item) =>
                Stack(

                  children: [
                    Container(
                      child: Image.asset(
                        'images/nourriture_bio.jpg',
                        fit: BoxFit.fill,
                        height: 320,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 40, 0, 10),
                                child: Text(
                                  '1000 fr . Fried Rice',
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: Text(
                                    'An exquise dish that you will love with your freind or alone',
                                    style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 27,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 10, 20),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        'Acheter maintenant',
                                        style: TextStyle(
                                            color: Colors.grey.shade300,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.chevron_right_outlined,
                                        color: CupertinoColors.white,
                                      )
                                    ],
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                      authenticateBackground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(24.0),
                                      ),
                                      shadowColor: Colors.deepOrangeAccent,
                                      elevation: 10),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
                .toList(),
          ),
          Container(
            height: 70,

            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (BuildContext context, int index) =>
                  Center(
                    child: Container(
                      margin: EdgeInsets.all(5),

                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          category[index],
                          style: TextStyle(color: Color(0xFFbf8f95),
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: CupertinoColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),


                            ),
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFFbf8f95),
                              style: BorderStyle.solid,
                            )
                        ),
                      ),
                    ),
                  ),
            ),

          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyclientCategory()),
                );
              },
                  child: Text('Toutes les catégories', style: TextStyle(
                      color: authenticateBackground,
                      fontWeight: FontWeight.bold),)),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyclientFilter()),
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: CupertinoColors.white,
                      size: 13,
                    ),
                    Text(
                      'Filtrer les produits',
                      style: TextStyle(color: Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),


                  ],
                ),
                style: TextButton.styleFrom(
                  backgroundColor:
                  authenticateBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(24.0),
                  ),
                ),
              ),
              SizedBox(width: 10,)
            ],),
          ClientTitleHome(title: 'Nouveau Produits',),
          ProductItem(),
          seeMore(),
          ClientTitleHome(title: 'Meilleurs ventes',),
          Container(
            height: 250,


            child: TopAndFast(),

          ),
          seeMore(),
          SizedBox(width: 10,),
          ClientTitleHome(title: 'Livraison rapide',),
          Container(
            height: 250,


            child: TopAndFast(),

          ),
          seeMore(),


        ],
      ),

    );
  }
}




