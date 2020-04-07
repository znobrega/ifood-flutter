import 'package:flutter/material.dart';

class ButtonIfood extends StatelessWidget {
  final String hint;
  final String label;

  ButtonIfood({this.hint, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 335,
      child: TextField(
        
        obscureText: true,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
