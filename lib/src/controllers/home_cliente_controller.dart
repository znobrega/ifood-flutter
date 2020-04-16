import 'package:dio/dio.dart';
import 'package:ifood_app/src/controllers/restaurante_controller.dart';
import 'package:ifood_app/src/env/env.dart';

class HomeClienteController {
  Dio dio = Dio();

  Future handleLogin(email, password) async {
    try {
      var response = await dio
          .get("${ENV.BASE_URL}/usuario", queryParameters: {"email": email});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future entregaGratis() async {
    var response = await dio.get("${ENV.BASE_URL}/restaurante/entregagratis");
    return response.data;
  }

  Future entregaRapida() async {
    var response = await dio.get("${ENV.BASE_URL}/restaurante/entregarapida");
    return response.data;
  }

  Future restaurantePopular() async {
    var response = await dio.get("${ENV.BASE_URL}/restaurante/popular");
    return response.data;
  }

  Future comidasPromocao() async {
    var response = await dio.get("${ENV.BASE_URL}/comida/promocao");
    return response.data;
  }

  Future mostPopular() async {
    var response = await dio.get("${ENV.BASE_URL}/comida/populares");
    return response.data;
  }

  Future search(String search) async {
    var response = await dio.post(
        "${ENV.BASE_URL}/comida/encontrarcomidapornome",
        data: {"nome_comida": search});
    return response.data;
  }

  Future historicoPedidos(int id) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/pedido/historicocliente",
          queryParameters: {"id_cliente": id});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future historicoPedidosRestaurante(int id) async {
    try {
      var response = await dio.get(
          "${ENV.BASE_URL}/pedido/historicorestaurante",
          queryParameters: {"id_restaurante": id});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future restaurantePopularMoura() async {
    try {
      var response = await dio.get(
          "${ENV.BASE_URL}/restaurante/populares");

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future comidasPedido(int id) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/pedido/comidas",
          queryParameters: {"id_pedido": id});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future restaurantePopularHudson() async {
    var response = await dio.get("${ENV.BASE_URL}/restaurante/popular");
    var restaurantes = response.data['restaurantes'];
    var populares = [];
    var restauranteController = RestauranteController();
    bool isPopular = true;

    for (var res in restaurantes) {
      isPopular = true;
      var cardapio =
          (await restauranteController.cardapio(res['id']))['cardapio'];
      for (var comida in cardapio) {
        if (comida['preco'] > 10) {
          isPopular = false;
          break;
        }
      }

      if (isPopular) populares.add(res);
    }

    response.data['restaurantes'] = populares;

    return response.data;
  }
}
