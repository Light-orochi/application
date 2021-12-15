import 'package:camdrives/provider/product.dart';
import 'package:flutter/material.dart';

import '../constante.dart';
Row buildRowTitle(String value) {
  return Row(
    children: [
      SizedBox(width: 20,),
      Text(value,style: ClientTitleStyle,),
    ],
  );
}
Row rowLocation() => Row(children: [Expanded(child: Text('Deido derriere ecole publique bla bla bla bla derriere ecole publique ',style: TextStyle(color: Colors.grey.shade400,fontSize: 15,fontWeight: FontWeight.w600),))],);

Column LocationAndQuater(List<Product> products, int index) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${products[index].location}\n ${products[index].quater}',style:LocationStyle,),
        ],
      ),

    ],
  );
}

Row seeMore() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [Container(margin: EdgeInsets.all(10), child: Text('Voir plus',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,decoration: TextDecoration.underline,color: Colors.grey.shade600),))],
  );
}


class ClientTitleHome extends StatelessWidget {
  final String title;
  const ClientTitleHome({ required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(onPressed: (){}, child: Text(title,style: ClientTitleStyle,)),
      ],);
  }
}
Container buildContainerlocation(IconData icon,String text,String mini) {
  return Container(

    padding:EdgeInsets.all(10),
    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade400,width: 1,)),color:Colors.grey.shade100,boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0.0, 1.0), blurRadius: 6.0)] ),
    child: Row(

      children: [
        Container(
//                color: Color(0xFFf23975),
          padding:EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(10, 10, 20, 10),
          decoration: BoxDecoration(shape: BoxShape.circle,color: Color(0xFFf23975),boxShadow: [BoxShadow(color:Color(0xFFf23975).withOpacity(0.7),spreadRadius: 5 ,blurRadius: 7)],),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(child: Text(text,style: ShowProductTitle,)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(mini, style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey.shade500),),
              ],
            ),
          ],
        )
      ],
    ),
  );
}