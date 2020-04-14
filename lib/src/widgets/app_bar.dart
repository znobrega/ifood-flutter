import 'package:flutter/material.dart';

class AppBarCenterTitle extends StatefulWidget {

  final String title;

  AppBarCenterTitle({Key key, this.title}) : super(key: key);

  @override
  _AppBarCenterTitleState createState() => _AppBarCenterTitleState();
}

class _AppBarCenterTitleState extends State<AppBarCenterTitle> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
       centerTitle: true,
       title: Text(widget.title),
    );
  }
}