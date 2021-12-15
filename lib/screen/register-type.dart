import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:flutter/material.dart';

class MyRegisterTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: authenticateBackground,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            print('close');
          },
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Container(child: Text('Connexion')),
      ),
      body: RegisterType(),
    );
  }
}

class RegisterType extends StatefulWidget {
  @override
  _RegisterTypeState createState() => _RegisterTypeState();
}

class _RegisterTypeState extends State<RegisterType> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('SELECTIONNER VOS PRODUITS',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)],),
              SizedBox(height: 60,),
              Container(
                margin: EdgeInsets.all(10),


               child:
               Row(
                 children: [
                   Expanded(child:Container(
                     padding: EdgeInsets.all(10),
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),color:Color(0xffB14C09),
                     ),
                     child: Column(
                       children: [
                         Icon(Icons.people_rounded,size: 60,),
                         Text('CLIENT',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                       ],
                     ),
                   ) ),
                   Expanded(child:Container(
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),color:Color(0xffB14C09),
                     ),
                     padding: EdgeInsets.all(10),
                     child: Column(
                       children: [
                         Icon(Icons.delivery_dining,size: 60,),
                         Text('LIVREUR',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                       ],
                     ),
                   ) ),
                   Expanded(child:Container(
                     margin: EdgeInsets.all(10),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),color:Color(0xffB14C09),
                     ),
                     padding: EdgeInsets.all(10),
                     child: Column(
                       children: [
                         Icon(Icons.business_center,size: 60,),
                         Text('PARTANAIRE',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                       ],
                     ),
                   ) ),
                 ],
               ),
              ),
              SizedBox(height: 50,),
              Container( margin: EdgeInsets.fromLTRB(25, 0, 25, 0),child: Divider(color: Colors.white70,thickness: 1.5,)),
              Container(



                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Nouveau ? ',style: TextStyle(color: Colors.grey.shade200),),
                    TextButton(onPressed: (){}, child:Text('S\'inscrire ici',style: TextStyle(color: Colors.white,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

