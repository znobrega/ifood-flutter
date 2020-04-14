import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:ifood_app/src/models/cart_item.dart';
import 'package:ifood_app/src/blocs/bloc_cart.dart';
import 'package:ifood_app/src/screens/cliente/submit_pedido.dart';
import 'package:ifood_app/src/widgets/button.dart';

class Cart extends StatefulWidget {
  final int idRestaurante;
  final int idCliente;

  Cart({this.idRestaurante, this.idCliente});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  BlocCart blocCart = BlocProvider.getBloc<BlocCart>();
  bool vazio = true;

  @override
  void initState() {
    // bloc.getCart(idTurma: widget.idTurma);
    print("Restaurante na vidso do cliente");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("CARRINHO "),
        ),
        body: items(),
      ),
    );
  }

  Widget items() {
    return StreamBuilder<List<CartItem>>(
      stream: blocCart.cartItems,
      builder: (BuildContext context, AsyncSnapshot<List<CartItem>> snapshot) {
        if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data?.length == 0) {
          print("${snapshot.data}");
          return Center(child: Text("Carrinho vazio"));
        } else {
          print("${snapshot.data}");
          return Column(
            children: [
              Flexible(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${snapshot.data[index].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                      "Preço: R\$ ${snapshot.data[index].priceTotal}")
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        blocCart.decrementAmount(index);
                                      });
                                      print("decrementar");
                                    }),
                                Text("${snapshot.data[index].amount}"),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      snapshot.data[index]..incrementAmount();
                                    });
                                    print("incrementar");
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("Total: R\$ ${blocCart.valueTotal()}"),
              ),
              ButtonIfood(
                text: "Finalizar pedido",
                onPressed: () {
                  setState(() {
                    //blocCart.sendPedido(blocCart.valueTotal(), widget.idRestaurante, widget.idCliente);
                    //blocCart.clearList();
                  });

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SubmitPedido(
                              valorTotal: blocCart.valueTotal(),
                              idRestaurante: widget.idRestaurante,
                              idCliente: widget.idCliente)));
                },
              ),
              SizedBox(
                height: 3,
              )
            ],
          );
        }
      },
    );
  }
}
