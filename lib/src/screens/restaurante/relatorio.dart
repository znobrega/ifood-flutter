import 'package:flutter/material.dart';

class Relatorio extends StatefulWidget {
  Relatorio({Key key}) : super(key: key);

  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Text("Relatorio"),
    );
  }
}