import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';
import 'package:ifood_app/src/validation/name_validator.dart';
import 'package:ifood_app/src/validation/price_validator.dart';

class CardapioController {
  Dio dio = Dio();
  
  Future addFood(int idRestaurante, String nome, String preco, String descricao) async {

    if(!NameValidator.validate(nome))
      return {"comida":[], "erro": "Nome inválido."};

    if(!NameValidator.validate(descricao))
      return {"comida":[], "erro": "Descrição inválida."};

    if(!PriceValidator.validate(preco))
      return {"comida":[], "erro": "Preço inválido."};
    
    double precoDouble = double.parse(preco);
    try {
      var response = await dio.post("${ENV.BASE_URL}/comida/adicionarcomida", 
      data: {
        "id_restaurante": idRestaurante,
        "nome": nome,
        "preco": precoDouble,
        "descricao": descricao
      },);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future updateFood(int idComida, String nome, String preco, String descricao, dynamic precoAnterior) async {
    
    if(!NameValidator.validate(nome))
      return {"comida":[], "erro": "Nome inválido."};

    if(!NameValidator.validate(descricao))
      return {"comida":[], "erro": "Descrição inválida."};

    if(!PriceValidator.validate(preco))
      return {"comida":[], "erro": "Preço inválido."};
    
    print(precoAnterior.runtimeType);
    double precoNovo = double.parse(preco);
    double precoAntigo = double.parse(precoAnterior.toString());
    bool promocao = false;

    if(precoNovo <= precoAntigo*0.5) {
      promocao = true;
    }

    try {
      var response = await dio.put("${ENV.BASE_URL}/comida/update", 
      data: {
        "id_comida": idComida,
        "nome": nome,
        "preco": precoNovo,
        "descricao": descricao,
        "promocao": promocao
      },);
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
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}