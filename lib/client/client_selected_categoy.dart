
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/categories.dart';
import 'package:camdrives/widgets/product-item.dart';
import 'package:camdrives/widgets/topandfast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';


class ClientSelectedCategory extends StatelessWidget {
  final String id;
  ClientSelectedCategory({required this.id});
  @override
  Widget build(BuildContext context) {

    final loadedcategory=  Provider.of<Categorie>(context,listen: false).findById(id);
    return Scaffold(


      backgroundColor: ClientScafoldColor,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            print('close');
          },
          child: Icon(Icons.close,
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
        backgroundColor: ClientScafoldColor,
        elevation: 0.5,
        title: Text(
          loadedcategory.title,
          style: clientTitleStyle,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [

                buildRowTitle(loadedcategory.title),
              ],
            ),
            Container(
                margin: EdgeInsets.fromLTRB(20, 5, 0, 20),
                child: Text(
                  '${loadedcategory.quantity} SPOTS',
                  style: LocationStyle,
                )),
            Row(mainAxisAlignment:MainAxisAlignment.end,children: [Container(padding:EdgeInsets.fromLTRB(0, 0, 10, 0),child: Text('Restaurants disponibles',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade600,fontSize: 15),),)],),
            Container(
              height: 100,

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:10,
                itemBuilder: (BuildContext context, int index) => Center(
                  child: Container(

                    height: 100,
                    width: 80,
                    margin: EdgeInsets.all(10),

                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'restaurant name',
                        style: TextStyle(color: Color(0xFFffffff),fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: CupertinoColors.systemBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),


                          ),

                          side: BorderSide(
                            width: 2,
                            color: CupertinoColors.systemBlue,
                            style: BorderStyle.solid,
                          )
                      ),
                    ),
                  ),
                ),
              ),

            ),
            Row(mainAxisAlignment:MainAxisAlignment.end,children: [Container(padding:EdgeInsets.fromLTRB(0, 0, 10, 0),child: Text('Restaurants disponibles',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade600,fontSize: 15),),)],),
            Container(
              height: 100,

              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:10,
                itemBuilder: (BuildContext context, int index) => Center(
                  child: Container(

                    height: 100,
                    width: 80,
                    margin: EdgeInsets.all(10),

                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'burgers',
                        style: TextStyle(color: Color(0xFFffffff),fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: CupertinoColors.systemBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),


                          ),

                          side: BorderSide(
                            width: 2,
                            color: CupertinoColors.systemBlue,
                            style: BorderStyle.solid,
                          )
                      ),
                    ),
                  ),
                ),
              ),

            ),

            buildRowTitle('Produits Populaires'),
            ProductItem(),

            ClientTitleHome(title: 'Meilleurs ventes',),
            Container(
              height: 250,


              child:TopAndFast(),

            ),
            seeMore(),
            SizedBox(width: 10,),
            ClientTitleHome(title: 'Livraison rapide',),
            Container(
              height: 250,


              child:TopAndFast(),

            ),
            seeMore(),
            Row(mainAxisAlignment:MainAxisAlignment.end,children: [Container(padding:EdgeInsets.fromLTRB(0, 0, 10, 0),child: Text('Voir plus de produits',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade600,fontSize: 10),),)],),
          ],
        ),
      ),
    );
  }
}
