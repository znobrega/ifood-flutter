import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class SignupController {
  Dio dio = Dio();

  static Future restaurante(String nome, String email, String password,
      String endereco, String categoria) async {
    Dio dio = Dio();

    var data =  {
        "nome": nome,
        "email": email,
        "senha": password,
        "endereco": endereco,
        "categoria": categoria,
        "provedor": true
      };

    try {
      var response = await dio.post("${ENV.BASE_URL}/restaurante/criar", data:data);
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
        "senha": password,
        "endereco": endereco,
        "provedor": false
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
