import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class CardapioController {
  Dio dio = Dio();
  
  Future addFood(int idRestaurante, String nome, String preco, String descricao) async {

    double precoDouble = double.parse(preco);
    try {
      var response = await dio.post("${ENV.BASE_URL}/comida/adicionarcomida", 
      data: {
        "id_restaurante": idRestaurante,
        "nome": nome,
        "preco": precoDouble,
        "descricao": descricao
      },);
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future updateFood(int idComida, String nome, String preco, String descricao) async {

    double precoDouble = double.parse(preco);
    try {
      var response = await dio.put("${ENV.BASE_URL}/comida/update", 
      data: {
        "id_comida": idComida,
        "nome": nome,
        "preco": precoDouble,
        "descricao": descricao
      },);
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
  
  Future deleteFromCardapio(int idComida) async {
    try {
      var response = await dio.put("${ENV.BASE_URL}/comida/delete", 
      data: {
        "id_comida": idComida,
      },);
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}