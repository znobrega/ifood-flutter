import 'package:flutter/material.dart';
import 'package:ifood_app/src/controllers/home_cliente_controller.dart';
import 'package:ifood_app/src/screens/cliente/pesquisa.dart';
import 'package:ifood_app/src/screens/cliente/restaurante_cliente.dart';
import 'package:ifood_app/src/screens/cliente/historico_cliente.dart';

class HomeCliente extends StatefulWidget {
  final Map<String, dynamic> usuario;

  HomeCliente({Key key, this.usuario}) : super(key: key);

  @override
  _HomeClienteState createState() => _HomeClienteState();
}

class _HomeClienteState extends State<HomeCliente> {
  int screenIndex = 0;

  HomeClienteController homeClienteController = HomeClienteController();
  var searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Página inicial"),
      ),
      body: [body(), HistoricoCliente(id: widget.usuario["id"])]
          .elementAt(screenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text("Restaurantes"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text("Histórico"),
          ),
        ],
        onTap: onBarTap,
        currentIndex: screenIndex,
      ),
    );
  }

  void onBarTap(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  Widget searchbar() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          height: 60,
          width: 335,
          child: TextField(
            controller: searchInputController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  handleSearch(context, searchInputController.text);
                },
              ),
              hintText: "Pesquise por palavra-chave",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget body() {
    return ListView(
      // child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        searchbar(),
        Text("Comidas mais populares"),
        buildPopulares(homeClienteController, widget.usuario["id"]),
        Text("Entrega rapida"),
        buildEntregaGratis(homeClienteController, widget.usuario["id"]),
        Text("Entrega gratis"),
        buildEntregaRapida(homeClienteController, widget.usuario["id"]),
        Text("Restaurantes populares(precos até R\$ 10)"),
        buildRestaurantesPopularesMoura(homeClienteController, widget.usuario["id"]),
        Text("Promoções"),
        buildPromocoes(homeClienteController, widget.usuario["id"]),
      ],
    );
  }
}

Widget buildPopulares(var homeClienteController, int id) {
  return FutureBuilder(
    future: homeClienteController.mostPopular(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data["comidas"].length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    ListTile(
                      title: Text("${snapshot.data["comidas"][index]["nome"]}"),
                      subtitle: Text(
                          "${snapshot.data["comidas"][index]["nomerestaurante"]}"),
                      onTap: () {
                        handleTileTap(
                            context,
                            snapshot.data["comidas"][index]["id_restaurante"],
                            snapshot.data["comidas"][index]["nomerestaurante"],
                            id,
                            snapshot.data["comidas"][index]["tipo_entrega"]);
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    },
  );
}

Widget buildPromocoes(var homeClienteController, int id) {
  return FutureBuilder(
    future: homeClienteController.comidasPromocao(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if(snapshot.connectionState == ConnectionState.done && !snapshot.hasData) {
        return Container(height:100, width: 100, child: Text("Sem promocoes"),);
      }

      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data["comidas"].length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    ListTile(
                      title: Text("${snapshot.data["comidas"][index]["nome_comida"]}"),
                      subtitle: Text(
                          "${snapshot.data["comidas"][index]["nome_restaurante"]}"),
                      onTap: () {
                        handleTileTap(
                            context,
                            snapshot.data["comidas"][index]["id_restaurante"],
                            snapshot.data["comidas"][index]["nomerestaurante"],
                            id,
                            snapshot.data["comidas"][index]["tipo_entrega"]);
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }
    },
  );
}

Widget buildEntregaGratis(var homeClienteController, int id) {
  return FutureBuilder(
          future: homeClienteController.entregaRapida(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data["restaurantes"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ListTile(
                            title: Text(
                                "${snapshot.data["restaurantes"][index]["nome"]}"),
                            subtitle: Text(
                                "${snapshot.data["restaurantes"][index]["tipo_entrega"]}"),
                            onTap: () {
                              handleTileTap(
                                  context,
                                  snapshot.data["restaurantes"][index]
                                      ["id"],
                                  snapshot.data["restaurantes"][index]
                                      ["nome"],
                                  id,
                                  snapshot.data["restaurantes"][index]["tipo_entrega"]);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}

Widget buildEntregaRapida(var homeClienteController, int id) {
  return FutureBuilder(
          future: homeClienteController.entregaGratis(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data["restaurantes"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ListTile(
                            title: Text(
                                "${snapshot.data["restaurantes"][index]["nome"]}"),
                            subtitle: Text(
                                "${snapshot.data["restaurantes"][index]["tipo_entrega"]}"),
                            onTap: () {
                              handleTileTap(
                                  context,
                                  snapshot.data["restaurantes"][index]
                                      ["id"],
                                  snapshot.data["restaurantes"][index]
                                      ["nome"],
                                  id,
                                  snapshot.data["restaurantes"][index]["tipo_entrega"]);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}

Widget buildRestaurantesPopulares(var homeClienteController, int id) {
  return FutureBuilder(
          future: homeClienteController.restaurantePopular(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data["restaurantes"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ListTile(
                            title: Text(
                                "${snapshot.data["restaurantes"][index]["nome"]}"),
                            subtitle: Text(
                                "${snapshot.data["restaurantes"][index]["tipo_entrega"]}"),
                            onTap: () {
                              handleTileTap(
                                  context,
                                  snapshot.data["restaurantes"][index]
                                      ["id"],
                                  snapshot.data["restaurantes"][index]
                                      ["nome"],
                                  id,
                                  snapshot.data["restaurantes"][index]["tipo_entrega"]);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}

Widget buildRestaurantesPopularesHudson(var homeClienteController, int id) {
  return FutureBuilder(
          future: homeClienteController.restaurantePopularHudson(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data["restaurantes"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ListTile(
                            title: Text(
                                "${snapshot.data["restaurantes"][index]["nome"]}"),
                            subtitle: Text(
                                "${snapshot.data["restaurantes"][index]["tipo_entrega"]}"),
                            onTap: () {
                              handleTileTap(
                                  context,
                                  snapshot.data["restaurantes"][index]
                                      ["id"],
                                  snapshot.data["restaurantes"][index]
                                      ["nome"],
                                  id,
                                  snapshot.data["restaurantes"][index]["tipo_entrega"]);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}

Widget buildRestaurantesPopularesMoura(var homeClienteController, int id) {
  return FutureBuilder(
          future: homeClienteController.restaurantePopularMoura(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data["restaurantes"].length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          ListTile(
                            title: Text(
                                "${snapshot.data["restaurantes"][index]["nome"]}"),
                            subtitle: Text(
                                "${snapshot.data["restaurantes"][index]["tipo_entrega"]}"),
                            onTap: () {
                              handleTileTap(
                                  context,
                                  snapshot.data["restaurantes"][index]
                                      ["id"],
                                  snapshot.data["restaurantes"][index]
                                      ["nome"],
                                  id,
                                  snapshot.data["restaurantes"][index]["tipo_entrega"]);
                            },
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
}

void handleSearch(BuildContext context, String search) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => Search(search: search)));
}

void handleTileTap(BuildContext context, int idRestaurante,
    String nomeRestaurante, int idCliente, String tipoEntrega) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => RestauranteCliente(
                idRestaurante: idRestaurante,
                nomeRestaurante: nomeRestaurante,
                idCliente: idCliente,
                tipoEntrega: tipoEntrega,
              )));
}
