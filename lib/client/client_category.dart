import 'package:camdrives/client/client_selected_categoy.dart';
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/function.dart';
import 'package:camdrives/provider/categories.dart';
import 'package:camdrives/provider/category.dart';
import 'package:camdrives/widgets/category-item.dart';
import 'package:camdrives/widgets/product-item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';



class MyclientCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


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
          'Catégories',
          style: clientTitleStyle,
        ),
      ),
      body: CategoryList(),
    );
  }

//  Expanded buildExpandedCaterory(String images,String text,String miniText) {
//    return
//      Expanded(
//                  child: Container(
//                    padding: EdgeInsets.all(10),
//                    margin: EdgeInsets.all(10),
//                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
//                child: Column(
//                  children: [
//                    Container(
//                      child: Image.asset(images,height: 100,),
//                    ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: [
//                        Expanded(
//                          flex: 2,
//                          child: Text(
//                            text,
//                            style: TextStyle(
//                                fontWeight: FontWeight.bold,
//                                color: Colors.grey.shade600,fontSize: 14),
//                          ),
//                        ),
//                        Expanded(
//                          flex: 1,
//                          child: TextButton(
//                              onPressed: () {},
//                              child: Icon(
//                                Icons.favorite_border_outlined,
//                                color: Colors.grey.shade600,
//                              )),
//                        ),
//                      ],
//                    ),
//                    Text(
//                      '$miniText  products',
//                      style: LocationStyle,
//                    ),
//                    Container(
//
//                      height: 28,
//                      margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
//                      child: TextButton(
//                        onPressed: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context)=>ClientSelectedCategory()));
//                        },
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: [
//                            Text(
//                              'Voir tout',
//                              style: TextStyle(
//                                  color:Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 11),
//                            ),
//                            Icon(
//                              Icons.chevron_right_outlined,
//                              color: CupertinoColors.white,
//                              size: 15,
//                            )
//                          ],
//                        ),
//                        style: TextButton.styleFrom(
//                            backgroundColor:
//                            authenticateBackground,
//                            shape: RoundedRectangleBorder(
//                              borderRadius:
//                              BorderRadius.circular(24.0),
//                            ),
//                          ),
//                      ),
//                    ),
//                  ],
//                ),
//              ));
//  }
}

class CategoryList extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final  categoriesData=  Provider.of<Categorie>(context,listen: false);
    final  categories=categoriesData.items;

    return ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        buildRowTitle('Toutes les catégories'),
        Container(
            margin: EdgeInsets.fromLTRB(20, 5, 0, 20),
            child: Text(
              '214 SPOTS',
              style: LocationStyle,
            )),

           GridView.builder(padding: EdgeInsets.all(0),
             physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(

               crossAxisCount: 2,
               childAspectRatio: 1 / 1.314,
               crossAxisSpacing: 5,
               mainAxisSpacing: 5),
           itemBuilder: (context,index)=>ChangeNotifierProvider.value(value: categories[index],
               child:buildExpandedCategory(images: categories[index].image,text: categories[index].title,miniText: categories[index].quantity,id: categories[index].id,)),
             itemCount: categories.length,),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//              buildExpandedCategory(images:'images/icons/shop.png',text:'Habillement',miniText:'9607'),
//               buildExpandedCategory(images:'images/icons/restaurants.png',text: 'Restaurant',miniText: '867')
//              ],
//            ),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: [
//
//             buildExpandedCategory(images:'images/icons/super.jpg',text: 'Supermarches',miniText: '267'),
//             buildExpandedCategory(images:'images/icons/business.png',text: 'Autres',miniText:'67')
//              ],
//            ),
        SizedBox(height: 20,),

        buildRowTitle('Produits Populaires'),
        ProductItem(),
      ],
    );
  }
}


class  buildExpandedCategory extends StatelessWidget {
 final  String images;
 final String text;
 final int miniText;
 final String id;
  const  buildExpandedCategory({
    required this.images,required this.text,required this.miniText, required this.id
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
      child: Column(
        children: [
          Container(
            child: Image.asset(images,height: 100,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,fontSize: 14),
                ),
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey.shade600,
                    )),
              ),
            ],
          ),
          Text(
            '$miniText products',
            style: LocationStyle,
          ),
          Container(

            height: 28,
            margin: EdgeInsets.fromLTRB(25, 10, 25, 0),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>ClientSelectedCategory(id:id)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Voir tout',
                    style: TextStyle(
                        color:Colors.grey.shade300,fontWeight: FontWeight.bold,fontSize: 11),
                  ),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: CupertinoColors.white,
                    size: 15,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
