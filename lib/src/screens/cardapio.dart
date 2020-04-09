import 'package:flutter/material.dart';
import 'package:ifood_app/src/screens/add_food.dart';

class Cardapio extends StatefulWidget {
  Cardapio();

  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  void initState() {
    // bloc.getCardapio(idTurma: widget.idTurma);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text("Arroz"),
            subtitle: Text("Arroz com molho ...."),
            trailing: IconButton(icon: Icon(Icons.more_vert), onPressed: null),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          AddComida("Editar comida")));
            },
          ),
        );
      },
    );
  }
}
