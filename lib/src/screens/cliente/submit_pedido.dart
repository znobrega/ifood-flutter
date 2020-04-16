import 'package:bloc_pattern/bloc_pattern.dart';
import "package:flutter/material.dart";
import 'package:ifood_app/src/blocs/bloc_cart.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';

class SubmitPedido extends StatefulWidget {
  final double valorTotal;
  final int idCliente;
  final int idRestaurante;
  final String tipoEntrega;

  SubmitPedido(
      {Key key,
      this.valorTotal,
      this.idCliente,
      this.idRestaurante,
      this.tipoEntrega})
      : super(key: key);

  @override
  _SubmitPedidoState createState() => _SubmitPedidoState();
}

class _SubmitPedidoState extends State<SubmitPedido> {
  TextEditingController enderecoController = TextEditingController();
  RestauranteController restauranteController = RestauranteController();
  BlocCart blocCart = BlocProvider.getBloc<BlocCart>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar pedido"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: restauranteController.restauranteById(widget.idRestaurante),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return Center(child: CircularProgressIndicator());
          }

          if(ConnectionState.done == snapshot.connectionState && !snapshot.hasData) {
            return Center(child: Text("erro"));
          }

          String entrega = snapshot.data["restaurante"][0]["tipo_entrega"];
          return ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 60,
                      width: 335,
                      child: TextField(
                        controller: enderecoController,
                        decoration: InputDecoration(
                          hintText: "Digite o endereco de entrega",
                          labelText: 'Endereço',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: 335,
                      child: Text(
                        "Tipo Entrega: ${snapshot.data["restaurante"][0]["tipo_entrega"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: 335,
                      child: Text(
                        "Valor total das comidas: ${widget.valorTotal}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      width: 335,
                      child: Text(
                        "Total com o frete: ${entrega == "rapida" ? widget.valorTotal + 2 : widget.valorTotal}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 60,
                      width: 335,
                      child: RaisedButton(
                        onPressed: () {
                          blocCart.sendPedido(blocCart.valueTotal(),
                              widget.idRestaurante, widget.idCliente,
                              enderecoController.text,
                              entrega);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeCliente()));
                        },
                        color: Color(0xffDF4723),
                        textColor: Colors.white,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(9.0)),
                        child: Text(
                          "Confirmar pedido",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
