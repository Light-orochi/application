import 'package:camdrives/auth/google_sign_in.dart';
import 'package:camdrives/client/profil-client.dart';
import 'package:camdrives/constante.dart';
import 'package:camdrives/helper/authenticatehelper.dart';
import 'package:flutter/material.dart';

class MyLoginScreen extends StatelessWidget {

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
  Widget build(BuildContext currentContext) {
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
                  'Se connecter',
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
                                hintText: 'Email ou numero de telephone',
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
                              hintText: 'Mot de passe',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: authenticateBackground, width: 2),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          MyButton(
                              text: 'Connecter',
                              colour: authenticateBackground,
                              textColour: Colors.white,

                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          MyDivider(
                            myLeft: 25,
                            myRight: 15,
                            colour: authenticateBackground,
                          ),
                          Text('Ou'),
                          MyDivider(
                            myLeft: 15,
                            myRight: 20,
                            colour: authenticateBackground,
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialLogin(icons: Icons.facebook,text: 'Facebook',background: Color(0xFF3c5a9a),marginleft: 25,marginRight: 10, ),
                          SocialLogin(icons: Icons.mail,text: 'Google',background: Color(0xFFe85a4e),marginleft: 10,marginRight: 25, ),


                        ],
                      )
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

