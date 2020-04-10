import 'package:flutter/material.dart';

class Historico extends StatefulWidget {
  Historico({Key key}) : super(key: key);

  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Pedido 1",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Total: RS 24,00"),
                ],
              ),
              subtitle: Text("2020"),
            ),
            children: <Widget>[
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Comida 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Total: RS 24,00"),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Comida 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Total: RS 24,00"),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Comida 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Total: RS 24,00"),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
