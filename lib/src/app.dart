import 'package:flutter/material.dart';

import './screens/login.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Login(),
    );
  }
}