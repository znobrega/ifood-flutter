import 'package:flutter/material.dart';

class AddComida extends StatefulWidget {
  final String titulo;
  
  AddComida(this.titulo);

  @override
  _AddComidaState createState() => _AddComidaState();
}

class _AddComidaState extends State<AddComida> {
  @override
  void initState() {
    // bloc.getAddComida(idTurma: widget.idTurma);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          title: Text(widget.titulo),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: addFood(context));
  }

  Widget addFood(BuildContext context) {
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
                  obscureText: true,
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
                  obscureText: true,
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
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Digite seu endereço",
                    labelText: 'Endereço',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: 335,
                child: RaisedButton(
                  onPressed: () {
                    //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Devs2()));
                  },
                  color: Color(0xffDF4723),
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: Text(
                    widget.titulo,
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
  }
}
