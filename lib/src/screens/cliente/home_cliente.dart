import 'package:flutter/material.dart';
import 'package:ifood_app/src/screens/cliente/pesquisa.dart';
import 'package:ifood_app/src/screens/historico.dart';
import 'package:ifood_app/src/screens/restaurante/relatorio.dart';

class HomeCliente extends StatefulWidget {
  HomeCliente({Key key}) : super(key: key);

  @override
  _HomeClienteState createState() => _HomeClienteState();
}

class _HomeClienteState extends State<HomeCliente> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: [body(), Relatorio(), Historico()].elementAt(screenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text("Restaurantes"),
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
    );
  }

  void onBarTap(int index) {
    print(index);
    setState(() {
      screenIndex = index;
    });
  }

  Widget searchbar() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 60,
          width: 335,
          child: TextField(
            onTap: () {
              print("tap");
            },
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print("Pesquisar...");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Search()));
                },
              ),
              hintText: "Pesquise por palavra-chave",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchbar(),
        Text("Mais populares"),
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5),
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Text("Arroz1"),
                  Text("Akita"),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
