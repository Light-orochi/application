import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:camdrives/helper/function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:group_button/group_button.dart';

class MyclientFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:ClientScafoldColor,
      appBar:  AppBar(

        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close,
              color: ClientAppBarColor, size: ClientAppBarSize),
        ),
        centerTitle: true,
        backgroundColor: ClientScafoldColor,
        elevation: 2.0,
        title: Text(
          'Filtrer',
          style: clientTitleStyle,
        ),

      ),
      body: FilterItems(),
    );
  }
}

class FilterItems extends StatefulWidget {
  @override
  _FilterItemsState createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  RangeValues _currentRangeValues = const RangeValues(40, 8000);
  RangeValues _metterCurrentRangeValues = const RangeValues(0, 200);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            buildRowTitle('Periode d\'ajout '),
            Row(

              children: [
                SizedBox(width: 20,),
                Text('Ce/Cette',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey.shade400,),),
              ],
            ),

            SizedBox(height:10 ,),
            GroupButton(
              spacing: 10,
              selectedColor: authenticateBackground,
              unselectedColor: Colors.white,
              buttons: const [
                'jour',
                'Mois',
                'Semaine',
                'hier',
              ],

              selectedTextStyle: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 15,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(10),
              onSelected: (i, selected) => debugPrint('Button #$i selected'),
            ),
            SizedBox(height:20 ,),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),


              child: Column(
                children: [
                  buildRowTitle('Categories '),
                  SizedBox(height: 20,),
                  Row(
                    children: [


                      buildExpandedCategories(Icons.store,'SuperMarchés'),
                      buildExpandedCategories(Icons.storefront_outlined,'Habillement'),
                      buildExpandedCategories(Icons.restaurant,'Restaurant'),
                      buildExpandedCategories(Icons.add_business,'Autres')
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),

              child:Column(
                children: [
                  buildRowTitle('filter le Prix'),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Text('0',style: LocationStyle,),
                      Expanded(
                        child: RangeSlider(
                          values: _currentRangeValues,
                          min: 0,
                          max: 20000,
                          divisions: 5,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString()+' Fr',
                            _currentRangeValues.end.round().toString()+' Fr',
                          ),activeColor: authenticateBackground,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                      ),
                      Text('20k fr',style: LocationStyle,),
                    ],
                  ),
                ],
              )
            ),
            SizedBox(height: 30,),

            Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.fromLTRB(0, 10, 0, 30),

              child:Column(
                children: [
                  buildRowTitle('Distance de vous'),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Text('0',style: LocationStyle,),
                      Expanded(
                        child: RangeSlider(

                          values: _metterCurrentRangeValues,
                          min: 0,
                          max: 2000,
                          divisions: 5,
                          labels: RangeLabels(

                            _currentRangeValues.start.round().toString()+' Fr',
                            _currentRangeValues.end.round().toString()+' Fr',
                          ),activeColor: authenticateBackground,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _metterCurrentRangeValues = values;
                            });
                          },
                        ),
                      ),
                      Text('2km',style: LocationStyle,),
                    ],
                  ),
                ],
              )
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                MyButton(text: 'Filtrer', colour:authenticateBackground, textColour: Colors.white),
              ],
            ),
            SizedBox(height: 30,),






          ],
        ),
      ),
    );
  }

  Expanded buildExpandedCategories(IconData icone,String text) {
    return Expanded(child: Column(children: [
               TextButton(onPressed: (){}, child: Icon(icone,size: 40,color: Colors.white,),style: TextButton.styleFrom(
                 padding: EdgeInsets.all(15),
                 backgroundColor:
                 authenticateBackground,
                 shape: RoundedRectangleBorder(
                   borderRadius:
                   BorderRadius.circular(50.0),
                 ),
               ),),
                SizedBox(height: 10,),
                Text(text,style: TextStyle(fontSize: 13,color:Color(0xFFb2b2b2),fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              ] ,));
  }


}
