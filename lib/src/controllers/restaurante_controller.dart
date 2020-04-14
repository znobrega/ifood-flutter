import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class RestauranteController {
  Dio dio = Dio();
  
  Future cardapio(int idRestaurante) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/restaurante/cardapio", queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future restauranteById(int idRestaurante) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/restaurante/show", queryParameters: {"id_restaurante": idRestaurante});
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}