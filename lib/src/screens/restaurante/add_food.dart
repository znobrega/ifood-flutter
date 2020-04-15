import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/cardapio_controller.dart';
import 'package:ifood_app/src/screens/restaurante/home_restaurante.dart';

class AddComida extends StatefulWidget {
  final Map<String, dynamic> usuario;
  final String title;
  final int idRestaurante;

  final int idComida;
  final String nome;
  final String descricao;
  final dynamic preco;

  AddComida(
      {this.title,
      this.idRestaurante,
      this.idComida,
      this.nome,
      this.descricao,
      this.preco,
      this.usuario});

  @override
  _AddComidaState createState() => _AddComidaState();
}

class _AddComidaState extends State<AddComida> {
  CardapioController cardapioController = CardapioController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController precoController = TextEditingController();

  @override
  void initState() {
    cardapioController = CardapioController();
    nomeController = TextEditingController();
    descricaoController = TextEditingController();
    precoController = TextEditingController();

    if (widget.idComida != null &&
        widget.nome != null &&
        widget.descricao != null) {
      nomeController.text = widget.nome;
      descricaoController.text = widget.descricao;
      precoController.text = widget.preco.toString();
    }
    // bloc.getAddComida(idTurma: widget.idTurma);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    HomeRestaurante(usuario: widget.usuario),
              ),
            );
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
                      if (widget.idComida == null) {
                        cardapioController
                            .addFood(widget.idRestaurante, nomeController.text,
                                precoController.text, descricaoController.text)
                            .then((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeRestaurante(usuario: widget.usuario),
                            ),
                          );
                        });
                      } else {
                        cardapioController
                            .updateFood(widget.idComida, nomeController.text,
                                precoController.text, descricaoController.text)
                            .then((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomeRestaurante(usuario: widget.usuario),
                            ),
                          );
                        });
                      }
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
