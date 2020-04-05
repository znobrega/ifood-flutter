import 'package:flutter/material.dart';
import 'package:ifood_app/src/screens/home_page.dart';
import 'package:ifood_app/src/screens/signup.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/ifood_logo.png",
                height: 200,
                width: 200,
              ),
              Container(
                height: 60,
                width: 335,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Digite seu email",
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
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
              Text(
                "Não possui conta?",
                style: TextStyle(
                  color: Color(0xffDF4723),
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5),
              Container(
                height: 50,
                width: 335,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Signup()));
                  },
                  color: Color(0xffDF4723),
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(9.0)),
                  child: Text(
                    "Cadastre-se",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}