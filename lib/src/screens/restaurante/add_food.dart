import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/cardapio_controller.dart';

class AddComida extends StatefulWidget {
  final String title;
  final int idRestaurante;

  final String nome;
  final String comida;
  final double preco;

  AddComida(
      {this.title, this.idRestaurante, this.nome, this.comida, this.preco});

  @override
  _AddComidaState createState() => _AddComidaState();
}

class _AddComidaState extends State<AddComida> {
  @override
  void initState() {
    // bloc.getAddComida(idTurma: widget.idTurma);
    super.initState();
  }

  CardapioController cardapioController = CardapioController();

  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
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
                    controller: nomeController,
                    decoration: InputDecoration(
                      hintText: "Nome da comida",
                      labelText: 'Nome comida',
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
                  height: 60,
                  width: 335,
                  child: TextField(
                    controller: descricaoController,
                    decoration: InputDecoration(
                      hintText: "Descricao da comida",
                      labelText: 'Descricao comida',
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
                  height: 60,
                  width: 335,
                  child: TextField(
                    controller: precoController,
                    decoration: InputDecoration(
                      hintText: "Preco da comida",
                      labelText: 'Preco comida',
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
                  height: 60,
                  width: 335,
                  child: RaisedButton(
                    onPressed: () {
                      cardapioController.addFood(
                          widget.idRestaurante,
                          nomeController.text,
                          precoController.text,
                          descricaoController.text);
                      Navigator.pop(context);
                    },
                    color: Color(0xffDF4723),
                    textColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(9.0)),
                    child: Text(
                      widget.title,
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
      ),
    );
  }
}
