import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';
import 'package:ifood_app/src/utils/TextStyles.dart';

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
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            child: FutureBuilder(
              future:
                  restauranteController.comidaMaisPedida(widget.idRestaurante),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.data["comida"].length == 0) {
                  return Text("Ainda não pediram comida em seu restaurante");
                }

                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Comida mais popular por QUANTIDADE:", style: TextStyles.styleBold),
                      Text("${snapshot.data["comida"][0]["nome"]}",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ],
                  ),
                  subtitle: Text(
                      "Vezes pedida: ${snapshot.data["comida"][0]["quantidade_pedida"]}"),
                );
              },
            ),
          ),
          Container(
            child: FutureBuilder(
              future:
                  restauranteController.comidaMaisPedidaPedido(widget.idRestaurante),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return Container();
                }

                if (snapshot.data["comida"].length == 0) {
                  return Container();
                }

                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Comida mais popular por PEDIDO:", style: TextStyles.styleBold),
                      Text("${snapshot.data["comida"][0]["nome"]}",
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ],
                  ),
                  subtitle: Text(
                      "Vezes pedida: ${snapshot.data["comida"][0]["vezes_pedida"]}"),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 1000,
            child: FutureBuilder(
              future: restauranteController.precoMedio(widget.idRestaurante),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: snapshot.data["comidas"].length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      if(snapshot.data["comidas"].length == 0) {
                        return Container();
                      }

                      return Text(
                        "Médias dos ultimos 7 dias",
                        style: TextStyles.styleBold,
                      );
                    }

                    return Card(
                      child: ListTile(
                        title: Text(
                            "${snapshot.data["comidas"][index - 1]["nome"]}"),
                        subtitle: Text(
                            "Preço médio: R\$ ${snapshot.data["comidas"][index - 1]["media"]}"),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
