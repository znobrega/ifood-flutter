import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';

class Relatorio extends StatefulWidget {
  final int idRestaurante;
  Relatorio({Key key, this.idRestaurante}) : super(key: key);

  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio> {
  RestauranteController restauranteController = RestauranteController();

  @override
  Widget build(BuildContext context) {
    return ListView(
         children: [
           FutureBuilder(
             future: restauranteController.comidaMaisPedida(widget.idRestaurante),
             builder: (context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                 return Center(child: CircularProgressIndicator());
               }

               if (snapshot.data["comida"].length == 0) {
                 return Text("Ainda não pediram comida em seu restaurante");
               }

               return Row(
                 children: <Widget>[
                   Text("Comida mais popular: ${snapshot.data["comida"][0]["nome"]}"),
                   Text("Vezes pedida: ${snapshot.data["comida"][0]["quantidade_pedida"]}"),
                 ],
               );
             },
           )
         ]
    );
  }
}