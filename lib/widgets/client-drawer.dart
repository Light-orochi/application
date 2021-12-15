import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 320,
            child: DrawerHeader(child: Column(
              children: [
                SizedBox(height: 60,),
                ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(decoration: BoxDecoration(color: Colors.red),child:Image.network('https://randomuser.me/api/portraits/med/men/75.jpg'),),



              ),
                SizedBox(height: 15,),
                Text('Bernard Du bois', style: drawerStyles,),
                SizedBox(height: 5,),
                Text('CLIENT', style: CartStyle,),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      height: 30,
                      child: TextButton(
                        onPressed: () {

                        },
                        style: TextButton.styleFrom(
                            backgroundColor: authenticateBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            shadowColor: Colors.deepOrangeAccent),
                        child: Text(
                          'Modifier',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:Colors.white, fontFamily: 'Monstera', fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),


              ],

            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title:  Text('HOME',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_activity),
            title:  Text('ACTIVITES',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title:  Text('CATEGORIES',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            title:  Text('FAVOURITES',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title:  Text('PANIER',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title:  Text('REQUETES',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Row(
            children: [
              MyDivider(myLeft: 30, myRight: 30, colour: Colors.grey.shade300),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title:  Text('PARAMETRES',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_power),
            title:  Text('SE DECONNECTER',style: CartStyle,),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),

        ],
      ),
    );
  }
}
