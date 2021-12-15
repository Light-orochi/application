import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyRegisterScreen extends StatelessWidget {
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
        title: Text('Inscription'),
      ),
      body: LoginClass(),
    );
  }
}

class LoginClass extends StatefulWidget {
  @override
  _LoginClassState createState() => _LoginClassState();
}

class _LoginClassState extends State<LoginClass> {

  @override
  Widget build(BuildContext context) {

    return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 15),
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'S\'inscrire',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.grey.shade700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Form(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Numero de telephone',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: authenticateBackground,
                                            width: 2))),
                              )),
                          Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Adresse Email ',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: authenticateBackground,
                                            width: 2))),
                              )),
                          Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: 'Mot de passe',
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: authenticateBackground,
                                            width: 2))),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: ' Confirmer mot de passe',
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: authenticateBackground, width: 2),
                                  ),
                                ),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox( value:false, onChanged: (bool? value) {  },shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),),
                              RichText(
                                text: TextSpan(
                                  text: 'Accepter nos  ',
                                  style: DefaultTextStyle.of(context).style,
                                  children: const <TextSpan>[
                                    TextSpan(text: 'conditions d\'utilisation', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),

                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MyButton(
                                  text: 'S\'inscrire',
                                  colour: authenticateBackground,
                                  textColour: Colors.white),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                     
                        ],
                      ),
                    )
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

