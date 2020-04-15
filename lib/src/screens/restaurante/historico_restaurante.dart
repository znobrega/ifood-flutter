import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/home_cliente_controller.dart';

class HistoricoRestaurante extends StatefulWidget {
  final int id;
  HistoricoRestaurante({Key key, this.id}) : super(key: key);

  @override
  _HistoricoRestauranteState createState() => _HistoricoRestauranteState();
}

class _HistoricoRestauranteState extends State<HistoricoRestaurante> {
  HomeClienteController homeClienteController = HomeClienteController();

  dynamic ganhoTotal;

  @override
  void initState() {

    Future lucro() async {
      var res =  await homeClienteController.historicoPedidosRestaurante(widget.id);
      ganhoTotal = res["pedidos"].fold(0, (total, pedido) {
        return total + pedido["preco_restaurante"];
      } );
    }
  
    lucro();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return FutureBuilder(
      future: homeClienteController.historicoPedidosRestaurante(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data["pedidos"].length == 0) {
          return Center(child: Text("Sem pedidos"));
        }
        print("HISTORICO PEDIDO:");
        print(snapshot.data);
        return ListView(children: [
          Text("Lucro total: $ganhoTotal"),
          Container(
            height: snapshot.data["pedidos"].length * 300.1,
            child: ListView.builder(
              itemCount: snapshot.data["pedidos"].length,
              itemBuilder: (BuildContext context, int index) {
                var precoTotal =
                    snapshot.data["pedidos"][index]["preco_restaurante"];
                
                String nome = snapshot.data["pedidos"][index]["nome"];
                String data = snapshot.data["pedidos"][index]["data"];
                var idPedido = snapshot.data["pedidos"][index]["id_pedido"];
                // String descricao = snapshot.data["cardapio"][index]["descricao"];
                // var preco = snapshot.data["cardapio"][index]["preco"];

                  // if(precoTotal != null) {
                  //   ganhoTotal += precoTotal;
                  // }

                return Center(
                  child: Column(
                    children: <Widget>[
                      ExpansionTile(
                        title: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "$nome",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Total: RS $precoTotal"),
                            ],
                          ),
                          subtitle: Text("$data"),
                        ),
                        children: <Widget>[
                          FutureBuilder(
                            future:
                                homeClienteController.comidasPedido(idPedido),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              print("comidas do pedido: id : $idPedido");
                              print(snapshot.data);

                              return Container(
                                height: snapshot.data["comidas"].length * 58.1,
                                child: ListView.builder(
                                  itemCount: snapshot.data["comidas"].length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            "${snapshot.data["comidas"][index]["nome"]}",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                              "x ${snapshot.data["comidas"][index]["quantidade"]}"),
                                          Text(
                                              "Preco Unid.: RS ${snapshot.data["comidas"][index]["preco"]}"),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      Divider(
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          
        ]);
      },
    );
  }
}
