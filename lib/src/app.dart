import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:ifood_app/src/blocs/bloc_cart.dart';
import 'package:ifood_app/src/blocs/bloc_home_cliente.dart';
import 'package:ifood_app/src/controllers/home_cliente_controller.dart';
import 'package:ifood_app/src/controllers/login_controller.dart';

import './screens/login.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => BlocCart()),
        Bloc((i) => BlocHomeClient()),
      ],
      dependencies: [
        Dependency((i) => LoginController(),),
        Dependency((i) => HomeClienteController()),
      ],
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Login(),
      ),
    );
  }
}
