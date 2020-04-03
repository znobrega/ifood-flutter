import 'package:flutter/material.dart';
import 'package:ifood_app/src/app.dart';

void main() => runApp(Ifood());

class Ifood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ifood app',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: App(),
    );
  }
}

