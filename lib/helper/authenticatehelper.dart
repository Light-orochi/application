
import 'package:camdrives/auth/google_sign_in.dart';
import 'package:camdrives/client/profil-client.dart';
import 'package:camdrives/constante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyButton extends StatefulWidget {

  final String text;
  final Color colour;
  final textColour;
  const MyButton(
      {Key? key,
      required this.text,
      required this.colour,
      required this.textColour,})
      : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  @override
  Widget build(BuildContext context) {
    return
      Expanded(
        child: Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      height: 50,
      child: TextButton(
        onPressed: () {
          print('pressed');
        },
        style: TextButton.styleFrom(
            backgroundColor: widget.colour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            shadowColor: Colors.deepOrangeAccent,
            elevation: 10),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: widget.textColour, fontFamily: 'Monstera', fontSize: 15),
        ),
      ),
    ));
  }
}

class MyDivider extends StatelessWidget {
  final double myLeft;
  final double myRight;
  final Color colour;

  const MyDivider(
      {Key? key,
      required this.myLeft,
      required this.myRight,
      required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Container(
          margin: EdgeInsets.fromLTRB(myLeft, 0, myRight, 0),
          child: Divider(
            color: colour,
            height: 20,
            thickness: 2,
          )),
    );
  }
}

class SocialLogin extends StatefulWidget {
  final IconData icons;
  final String text;
  final Color background;
  final double marginleft;
  final double marginRight;
  const SocialLogin({
    Key? key,
    required this.icons,
    required this.text,
    required this.background,
    required this.marginleft,
    required this.marginRight,
  }) : super(key: key);

  @override
  _SocialLoginState createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(widget.marginleft, 0, widget.marginRight, 0),
        child: TextButton(
          onPressed: FacebookSign,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icons,
                color: Colors.white,
                size: 30,
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          style: TextButton.styleFrom(
              backgroundColor: widget.background,
              shadowColor: Colors.deepOrangeAccent,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)
              )
          ),
        ),
      ),
    );
  }

  Future signIn() async{
    final user = await GoogleSignInApi.login();
    if(user==null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('pas d\'utilisateur')));
    }
    else{

      Navigator.of(context ).pushReplacement(MaterialPageRoute(builder:
          (context)=>ClientProfil(client:user)));
    }
  }

  Future FacebookSign() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ["public_profile","email"]
    ); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
       print(result);
      final AccessToken accessToken = result.accessToken!;
    } else {
      print(result.status);
      print(result.message);
    }
  }


}



