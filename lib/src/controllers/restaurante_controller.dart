import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class RestauranteController {
  Dio dio = Dio();

  Future cardapio(int idRestaurante) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/restaurante/cardapio",
          queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future restauranteById(int idRestaurante) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/restaurante/show",
          queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future comidaMaisPedida(int idRestaurante) async {
    try {
      var response = await dio.get(
          "${ENV.BASE_URL}/restaurante/comidamaispedida",
          queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future precoMedio(int idRestaurante) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/restaurante/precomedio",
          queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future updateEntrega(int idRestaurante, String tipoEntrega) async {
    try {
      var response = await dio.put("${ENV.BASE_URL}/restaurante/tipoentrega", 
      data: {
        "id_restaurante": idRestaurante,
        "tipo_entrega": tipoEntrega,
      },);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
