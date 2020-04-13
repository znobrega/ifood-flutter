import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/home_cliente_controller.dart';
import 'package:ifood_app/src/screens/cliente/restaurante_cliente.dart';

class Search extends StatefulWidget {
  final String search;
  Search({Key key, this.search}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  HomeClienteController homeClienteController = HomeClienteController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado pesquisa"),
      ),
      body: FutureBuilder(
        future: homeClienteController.search(widget.search),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          print("Comidas:");
          if (!snapshot.hasData || snapshot.hasError || snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data["comidas"].length,
            itemBuilder: (BuildContext context, int index) {
              String comidaNome =
                  snapshot.data["comidas"][index]["comida_nome"];
              String descricao = snapshot.data["comidas"][index]["descricao"];
              var preco = snapshot.data["comidas"][index]["preco"];
              return Card(
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$comidaNome"),
                        Text("R\$ $preco"),
                      ]),
                  subtitle: Text("$descricao"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RestauranteCliente(idRestaurante: snapshot.data["comidas"][index]["id_restaurante"],
                                 nomeRestaurante: snapshot.data["comidas"][index]["nome"])));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
