import 'package:flutter/material.dart';
import 'package:ifood_app/src/screens/add_food.dart';
import 'package:ifood_app/src/screens/cardapio.dart';
import 'package:ifood_app/src/screens/historico.dart';
import 'package:ifood_app/src/screens/restaurante/relatorio.dart';
import 'package:ifood_app/src/utils/ColorsIfood.dart';

class HomeRestaurante extends StatefulWidget {
  HomeRestaurante();

  @override
  _HomeRestauranteState createState() => _HomeRestauranteState();
}

class _HomeRestauranteState extends State<HomeRestaurante> {
  @override
  void initState() {
    // bloc.getHomeRestaurante(idTurma: widget.idTurma);
    super.initState();
  }

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text("HomeRestaurante s"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: [Cardapio(), Relatorio(), Historico()].elementAt(screenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text("Cardápio"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            title: Text("Relatório"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("Historico"),
          ),
        ],
        onTap: onBarTap,
        currentIndex: screenIndex,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      AddComida("Adicionar comida")));
        },
        elevation: 2,
        autofocus: false,
        backgroundColor: ColorsIfood.main,
        splashColor: ColorsIfood.secondary,
        child: Icon(Icons.add),
      ),
    );
  }

  void onBarTap(int index) {
    setState(() {
      screenIndex = index;
    });
  }
}