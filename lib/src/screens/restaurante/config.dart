import "package:flutter/material.dart";
import 'package:ifood_app/src/controllers/restaurante_controller.dart';
import 'package:ifood_app/src/screens/cliente/home_cliente.dart';
import 'package:ifood_app/src/screens/restaurante/home_restaurante.dart';
import 'package:ifood_app/src/utils/TextStyles.dart';

class Configs extends StatefulWidget {
  final String title;
  final Map<String, dynamic> usuario;
  final int idRestaurante;
  final String tipoEntrega;
  Configs({Key key, this.title, this.idRestaurante, this.tipoEntrega, this.usuario}) : super(key: key);

  @override
  _ConfigsState createState() => _ConfigsState();
}

class _ConfigsState extends State<Configs> {
  String dropdownStatus = "Aberto";
  String dropdownEntrega;

  RestauranteController restauranteController = RestauranteController();
  @override
  Widget build(BuildContext context) {
  dropdownEntrega = widget.usuario["tipo_entrega"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}",
        ),
        centerTitle: true,
        leading: IconButton(icon: 
        Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeRestaurante(usuario: widget.usuario)));
        }),
      ),

      body: ListView(
        
        children: [
          Center(child: Text("Configurações", style: TextStyles.styleBold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Tipo Entrega: ", style: TextStyles.styleBold,),
              DropdownButton<String>(
                value: dropdownEntrega,
                hint: Text("teste jing ds  "),
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  width: 80,
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {

                  restauranteController.updateEntrega(widget.idRestaurante, newValue);
                  setState(() {
                    dropdownEntrega = newValue;
                    widget.usuario["tipo_entrega"] = newValue;
                  });
                },
                items: <String>['gratis', 'rapida']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Status: ",
                style: TextStyles.styleBold,
              ),
              DropdownButton<String>(
                hint: Text("Escolha", style: TextStyles.styleBold),
                value: "Aberto",
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  width: 100,
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {},
                items: <String>['Aberto', 'Fechado']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
