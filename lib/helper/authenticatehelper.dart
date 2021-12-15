import 'package:camdrives/constante.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Color colour;
  final textColour;
  const MyButton(
      {Key? key,
      required this.text,
      required this.colour,
      required this.textColour})
      : super(key: key);

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
            backgroundColor: colour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            shadowColor: Colors.deepOrangeAccent,
            elevation: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColour, fontFamily: 'Monstera', fontSize: 15),
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

class SocialLogin extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(marginleft, 0, marginRight, 0),
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons,
                color: Colors.white,
                size: 30,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
          style: TextButton.styleFrom(
              backgroundColor: background,
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
}
