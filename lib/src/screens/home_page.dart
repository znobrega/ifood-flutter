import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página inicial"),
      ),
      body: body()
    );
  }

  Widget body() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Mais populares"),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Text("Arroz1"),
                    Text("Akita"),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
  }
}
