import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showInfoDialog(BuildContext context, String title,
                String description, String confirmBtnTxt) {
  // set up the buttons
  Widget confirmButton = FlatButton(
    child: Text(confirmBtnTxt),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog
    },
  );  
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      confirmButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}