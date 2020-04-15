import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class SignupController {
  Dio dio = Dio();

  static Future restaurante(String nome, String email, String password,
      String endereco, String categoria) async {
    Dio dio = Dio();
    try {
      var response = await dio.post("${ENV.BASE_URL}/restaurante/criar", data: {
        "nome": nome,
        "email": email,
        "password": password,
        "endereco": endereco,
        "categoria": categoria
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static Future cliente(
      String nome, String email, String password, String endereco) async {
    Dio dio = Dio();
    try {
      var response = await dio.post("${ENV.BASE_URL}/cliente/criar", data: {
        "nome": nome,
        "email": email,
        "password": password,
        "endereco": endereco
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
