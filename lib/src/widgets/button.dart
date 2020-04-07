import 'package:flutter/material.dart';

class ButtonIfood extends StatelessWidget {
  final String text;
  final Function onPressed;

  ButtonIfood({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 335,
      child: RaisedButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Devs2()));
        },
        color: Color(0xffDF4723),
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(9.0)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
