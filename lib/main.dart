import 'package:camdrives/client/client_home.dart';
import 'package:camdrives/client/client_show_product.dart';
import 'package:camdrives/client/test.dart';
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:camdrives/livreur/deliver-data.dart';
import 'package:camdrives/livreur/deliver-profil.dart';
import 'package:camdrives/partenaire/partener-home-list.dart';
import 'package:camdrives/partenaire/partner-home.dart';
import 'package:camdrives/partenaire/partner-products.dart';
import 'package:camdrives/provider/Order.dart';
import 'package:camdrives/provider/cart.dart';
import 'package:camdrives/provider/categories.dart';
import 'package:camdrives/provider/category.dart';
import 'package:camdrives/provider/product.dart';
import 'package:camdrives/provider/products.dart';
import 'package:camdrives/screen/client-rate.dart';
import 'package:camdrives/screen/login.dart';
import 'package:camdrives/screen/register-type.dart';
import 'package:camdrives/screen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'livreur/deliver-home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(

      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (context)=>Products(),),
          ChangeNotifierProvider(create: (context)=>Categorie(),),
          ChangeNotifierProvider(create: (context)=>Cart()),
          ChangeNotifierProvider(create: (context)=>Order()),
        ],
      child:MaterialApp(

      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Montserrat'),
      home:MyLoginScreen()
,        routes: {

//        ShowProducts.routeName:(context)=>ShowProducts(product: null,)
        },
    ),

    );

  }

}




class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: authenticateBackground,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(child:Image.asset('images/Logo.png') ,),
            Row(
              children: [
                MyButton(
                  text: 'Se Connecter',
                  colour: Colors.white,
                  textColour: authenticateBackground,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                MyDivider(
                  myLeft: 25.0,
                  myRight: 10,
                  colour: Colors.white,
                ),
                Text(
                  "Ou",
                  style: TextStyle(color: Colors.white),
                ),
                MyDivider(
                  myLeft: 10.0,
                  myRight: 25,
                  colour: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                        margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text('Creer un compte',style: TextStyle(color: Colors.white,fontSize: 15),),

                            style: OutlinedButton.styleFrom(
                              backgroundColor: authenticateBackground,

                              side: BorderSide(color: Colors.white),
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0),),


                            ),


                        )
                    )
                )
              ],
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
