import 'package:camdrives/constante.dart';
import 'package:camdrives/provider/Order.dart';
import 'package:camdrives/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
       appBar: AppBar(
          leading: TextButton(
            onPressed: () {
              print('close');
            },
            child: Icon(Icons.close,
                color: ClientAppBarColor, size: ClientAppBarSize),
          ),
//          actions: [
//            Row(
//              children: [
//                Icon(
//                  Icons.notifications_none_outlined,
//                  color: ClientAppBarColor,
//                  size: ClientAppBarSize,
//                ),
//                SizedBox(
//                  width: 20,
//                ),
//                Icon(Icons.search_outlined,
//                    color: ClientAppBarColor, size: ClientAppBarSize)
//              ],
//            )
//          ],
          centerTitle: true,
          backgroundColor: ClientScafoldColor,
          elevation: 0.5,
          title: Text(
            'Panier',
            style: clientTitleStyle,
          ),
        ),
      body:CartItems(),

    );
  }
}

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: Column(
       children: [Container(

         padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
         decoration: BoxDecoration(border: Border(bottom:BorderSide(color:Colors.grey.shade400,width: 1.0,style: BorderStyle.solid ))),
         child: Row(
          children: [
            Expanded( flex: 1,child: Text(''),),
            Expanded( flex: 3,child: Text('PRODUIT',style: CartStyle),),
            Expanded( flex: 3,child: Text('PRIX',style: CartStyle),),
            Expanded( flex: 1,child: Text('QTE',style: CartStyle),),
            Expanded( flex: 1,child: Text(''),),


          ],
         ),
       ),
       ListView.builder(
           physics: NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount:cart.itemCount,itemBuilder:(context,index)=>
         Container(
           decoration: BoxDecoration(border: Border(bottom:BorderSide(color:Colors.grey.shade400,width: 1.0,style: BorderStyle.solid ))),

           child: Row(
             children: [
               Expanded(flex:1,child: Image.network(cart.items.values.toList()[index].image,width: 20,height: 40,)),
               Expanded(flex:3,child: Text('${cart.items.values.toList()[index].title}',style: CartStyles)),
               Expanded(flex:3,child: Text('${cart.items.values.toList()[index].price}',style: CartStyles)),
               Expanded(flex:2,child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [


                  Expanded(child:Icon(Icons.remove_circle_outline)),
                   Text('${cart.items.values.toList()[index].quantity}'),
                  Expanded(child: Icon(Icons.add_circle_outline)),

    ],)),
               Expanded( flex: 1,child: IconButton(onPressed:(){} ,icon:Icon(Icons.delete),),),
             ],
           ),
         )
       ),
         SizedBox(height: 30,),

         Row(
           children: [
             Expanded(
                 child: Container(
                   margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                   height: 50,
                   child: TextButton(
                     onPressed: () {
                         Provider.of<Order>(context,listen: false).addOrder(cart.items.values.toList(),cart.totalAmount );
                         cart.clearCart();
                     },
                     style: TextButton.styleFrom(
                         backgroundColor: authenticateBackground,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(5.0),
                         ),
                         shadowColor: Colors.deepOrangeAccent,
                        ),
                     child: Row(
                       mainAxisAlignment:MainAxisAlignment.center,
                       children: [
                         Text(
                           'Passer la commande ',
                           textAlign: TextAlign.center,
                           style: TextStyle(
                               color:Colors.white, fontFamily: 'Monstera', fontSize: 15),
                         ),


                         Icon(Icons.chevron_right,size: 25,color: Colors.white,)
                       ],
                     ),
                   ),

                 )),

           ],
         )
       ],
      ),
    );
  }
}
