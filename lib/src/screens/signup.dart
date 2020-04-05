import 'package:flutter/material.dart';
import 'package:ifood_app/src/screens/home_page.dart';

class Signup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text("Cadastro"),
          ),
        ),
        body: tabs(context));
  }
}

Widget tabs(BuildContext context) {
  return (ListView(
    children: <Widget>[
      SizedBox(
        height: 10,
      ),
      DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: <Widget>[
            TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              tabs: <Widget>[
                Tab(
                  text: 'Usuário',

                ),
                Tab(
                  text: 'Restaurante',
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(
                children: <Widget>[
                  formUsuario(context),
                  formRestaurante(context)
                ],
              ),
            )
          ],
        ),
      )
    ],
  ));
}

Widget formUsuario(BuildContext context) {
  return ListView(
    children: <Widget>[
      SizedBox(height: 20,),
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
                  hintText: "Digite seu nome",
                  labelText: 'Nome',
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
                  hintText: "Digite sua email",
                  labelText: 'Email',
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
                  hintText: "Digite sua senha",
                  labelText: 'Senha',
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
                  "Criar usuário",
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

Widget formRestaurante(BuildContext context) {
  return ListView(
    children: <Widget>[
      SizedBox(height: 20,),
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 20),
      //   child: Center(
      //     child: Text(
      //       "Cadastro",
      //       style: TextStyle(
      //         // fontWeight: FontWeight.bold,
      //         color: Color(0xffDF4723),
      //         fontSize: 28,
      //       ),
      //     ),
      //   ),
      // ),
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
                  hintText: "Digite seu nome",
                  labelText: 'Nome',
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
                  hintText: "Digite sua email",
                  labelText: 'Email',
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
                  hintText: "Digite sua senha",
                  labelText: 'Senha',
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
            SizedBox(height: 10),
            Container(
              height: 60,
              width: 335,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Digite sua categoria",
                  labelText: 'Categoria',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Text("Tipo entrega: "),
                  DropdownButton<String>(
                    hint: Text("Escolha o tipo de entrega"),
                    value: "Frete grátis",
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
                    items: <String>['Frete grátis', 'Entrega rápida']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: 335,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage()));
                },
                color: Color(0xffDF4723),
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(9.0)),
                child: Text(
                  "Criar restaurante",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    ],
  );
}
