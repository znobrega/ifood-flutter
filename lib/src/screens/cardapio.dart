import 'package:flutter/material.dart';

class Cardapio extends StatefulWidget {
  Cardapio();

  @override
  _CardapioState createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  void initState() {
    // bloc.getCardapio(idTurma: widget.idTurma);
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Text("Cardapio"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: buildCardapio(context));
  }

  // Future getCardapio() {}

  // Widget listStudents() {
  //   return FutureBuilder(
  //     future: getCardapio,
  //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
  //       if (snapshot.hasData && !snapshot.hasError) {
  //         return ListView.builder(
  //           itemCount: snapshot.data?.length ?? 0,
  //           itemBuilder: (BuildContext context, int index) {
  //             if (snapshot.data.length == 0) {
  //               return Center(
  //                 child: Text("Nenhuma comida cadastrada"),
  //               );
  //             }
  //             return buildCardapio(snapshot.data[index], context);
  //           },
  //         );
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }

  Widget buildCardapio(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text("Arroz"),
            subtitle: Text("Arroz com molho ...."),
            onTap: null,
          ),
        );
      },
    );
  }
}
