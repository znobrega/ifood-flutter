import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/signup_controller.dart';
import 'package:ifood_app/src/screens/alert_dialog.dart';

class Signup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text("Cadastro"),
          ),
        ),
        body: SignupTabs.tabs(context));
  }
}

class SignupTabs{

  static var nomeController = TextEditingController();
  static var emailController = TextEditingController();
  static var passwordController = TextEditingController();
  static var enderecoController = TextEditingController();
  static var categoriaController = TextEditingController();

  static Widget tabs(BuildContext context) {
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

  static Widget formUsuario(BuildContext context) {
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
                  controller: nomeController,
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
                  controller: emailController,
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
                  controller: passwordController,
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
                  controller: enderecoController,
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
                    SignupController.cliente(
                            nomeController.text,
                            emailController.text,
                            passwordController.text,
                            enderecoController.text)
                        .then((res) {
                      
                      if(res["usuario"].isEmpty)
                        showInfoDialog(
                          context,
                          "Erro",
                          res["erro"],
                          "Entendi",
                        );
                          
                      else
                        Navigator.pop(
                          context,
                        );
                    });
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

  static Widget formRestaurante(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.of(context).size.height + 100,
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
                  controller: emailController,
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
                  controller: passwordController,
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
                  controller: enderecoController,
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
                  controller: categoriaController,
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
              Container(
                height: 60,
                width: 335,
                child: RaisedButton(
                  onPressed: () {
                    SignupController.restaurante(
                            nomeController.text,
                            emailController.text,
                            passwordController.text,
                            enderecoController.text,
                            categoriaController.text)
                        .then((res) {
                      
                      if(res["usuario"].isEmpty)
                        showInfoDialog(
                          context,
                          "Erro",
                          res["erro"],
                          "Entendi",
                        );
                          
                      else
                        Navigator.pop(
                          context,
                        );
                    });
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
              SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

}
