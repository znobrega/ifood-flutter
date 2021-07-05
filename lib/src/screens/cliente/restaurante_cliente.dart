import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:ifood_app/src/blocs/bloc_cart.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';
import 'package:ifood_app/src/models/cart_item.dart';
import 'package:ifood_app/src/screens/cliente/cart.dart';
import 'package:ifood_app/src/screens/alert_dialog.dart';

class RestauranteCliente extends StatefulWidget {
  final int idRestaurante;
  final int idCliente;
  final String nomeRestaurante;
  final String tipoEntrega;
  RestauranteCliente(
      {this.idRestaurante, this.nomeRestaurante, this.idCliente, this.tipoEntrega});

  @override
  _RestauranteClienteState createState() => _RestauranteClienteState();
}

class _RestauranteClienteState extends State<RestauranteCliente> {
  BlocCart blocCart = BlocProvider.getBloc<BlocCart>();

  @override
  void initState() {
    // bloc.getRestauranteCliente(idTurma: widget.idTurma);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("${widget.nomeRestaurante}"),
        ),
        body: cardapio(),
        floatingActionButton: cart(),
      ),
    );
  }

  Widget cardapio() {
    RestauranteController restauranteController = RestauranteController();

    return FutureBuilder(
      future: restauranteController.cardapio(widget.idRestaurante),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data["cardapio"].length,
          itemBuilder: (BuildContext context, int index) {
            String comidaNome = snapshot.data["cardapio"][index]["comida_nome"];
            String descricao = snapshot.data["cardapio"][index]["descricao"];
            var preco = snapshot.data["cardapio"][index]["preco"];
            int idComida = snapshot.data["cardapio"][index]["id_comida"];
            int idRestaurante = snapshot.data["cardapio"][index]["id_restaurante"];
            return Card(
              child: ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("$comidaNome"),
                      Text("R\$ $preco"),
                    ]),
                subtitle: Text("$descricao"),
                trailing: Icon(Icons.add_shopping_cart),
                onTap: () {
                  if(blocCart.items == null || idRestaurante == blocCart.items.first.restaurantId)
                    blocCart.addItem(CartItem(comidaNome, preco, idComida, idRestaurante, 1));
                  
                  else
                    showInfoDialog(
                      context,
                      "Erro",
                      "Seu pedido só pode conter comidas de um único restaurante.",
                      "Entendi",
                    );
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget cart() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Cart(
                    idRestaurante: widget.idRestaurante,
                    idCliente: widget.idCliente)));
      },
      child: Icon(Icons.shopping_cart),
    );
  }
}
