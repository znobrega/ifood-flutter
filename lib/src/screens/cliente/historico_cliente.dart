import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/home_cliente_controller.dart';

class HistoricoCliente extends StatefulWidget {
  final int id;
  HistoricoCliente({Key key, this.id}) : super(key: key);

  @override
  _HistoricoClienteState createState() => _HistoricoClienteState();
}

class _HistoricoClienteState extends State<HistoricoCliente> {
  HomeClienteController homeClienteController = HomeClienteController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeClienteController.historicoPedidos(widget.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data["pedidos"].length,
          itemBuilder: (BuildContext context, int index) {
            var precoTotal = snapshot.data["pedidos"][index]["preco_cliente"];
            String nome = snapshot.data["pedidos"][index]["nome"];
            String data = snapshot.data["pedidos"][index]["data"];
            var idPedido = snapshot.data["pedidos"][index]["id_pedido"];
            // String descricao = snapshot.data["cardapio"][index]["descricao"];
            // var preco = snapshot.data["cardapio"][index]["preco"];
            return Center(
              child: Card(
                elevation: 2,
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
                          future: homeClienteController.comidasPedido(idPedido),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator(),);
                            } 


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
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text("x ${snapshot.data["comidas"][index]["quantidade"]}"),
                                    Text("Preco Unid.: RS ${snapshot.data["comidas"][index]["preco"]}"),
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
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
