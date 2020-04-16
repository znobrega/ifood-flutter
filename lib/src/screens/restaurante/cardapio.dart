import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/cardapio_controller.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';
import 'package:ifood_app/src/screens/restaurante/add_food.dart';
import 'package:ifood_app/src/utils/ColorsIfood.dart';

class Cardapio extends StatefulWidget {
  final Map<String, dynamic> usuario;
  Cardapio({this.usuario});

  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  void initState() {
    // bloc.getCardapio(idTurma: widget.idTurma);
    super.initState();
  }

  RestauranteController restauranteController = RestauranteController();
  CardapioController cardapioController = CardapioController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: restauranteController.cardapio(widget.usuario["id"]),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(snapshot.data["cardapio"].length == 0) {
          return Center(child: Text("Adicione comidas no cardápio!"));
        }

        if(snapshot.connectionState == ConnectionState.done) {
        }
        return ListView.builder(
          itemCount: snapshot.data["cardapio"].length,

          itemBuilder: (BuildContext context, int index) {
            String comidaNome = snapshot.data["cardapio"][index]["comida_nome"];
            String descricao = snapshot.data["cardapio"][index]["descricao"];
            var preco = snapshot.data["cardapio"][index]["preco"];
            //int idComida = snapshot.data["cardapio"][index]["id_comida"];
            return Card(
              child: Dismissible(
                background: Container(color: ColorsIfood.main),
                key: UniqueKey(),
                onDismissed: (direction) {
                  cardapioController
                      .deleteFromCardapio(
                          snapshot.data["cardapio"][index]["id_comida"])
                      .then(
                    (onValue) {
                      setState(() {
                        snapshot.data["cardapio"].removeAt(index);
                      });
                    },
                  );
                },
                child: ListTile(
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$comidaNome"),
                        Text("R\$ $preco"),
                      ]),
                  subtitle: Text("$descricao"),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AddComida(
                          title: "Editar comida",
                          idRestaurante: widget.usuario["id"],
                          idComida: snapshot.data["cardapio"][index]["id_comida"],
                          nome: comidaNome,
                          descricao: descricao,
                          preco: preco,
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
