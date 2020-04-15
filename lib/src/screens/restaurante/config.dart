import "package:flutter/material.dart";
import 'package:ifood_app/src/utils/TextStyles.dart';

class Configs extends StatefulWidget {
  final String title;
  Configs({Key key, this.title}) : super(key: key);

  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
        ),
        centerTitle: true,
      ),
      body: ListView(
        
        children: [
          Text("Configs:"),
          Row(
            children: <Widget>[
              Text("Tipo Entrega: "),
              DropdownButton<String>(
                hint: Text("Escolha o tipo de entrega",
                    style: TextStyles.styleBold),
                value: "Frete grátis",
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  width: 100,
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {},
                items: <String>['Frete grátis', 'Entrega rápida']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Status: ",
                style: TextStyles.styleBold,
              ),
              DropdownButton<String>(
                hint: Text("Escolha o status", style: TextStyles.styleBold),
                value: "Aberto",
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  width: 100,
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {},
                items: <String>['Aberto', 'Fechado']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
