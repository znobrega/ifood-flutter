import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';
import 'package:ifood_app/src/validation/name_validator.dart';
import 'package:ifood_app/src/validation/email_validator.dart';
import 'package:ifood_app/src/validation/password_validator.dart';
import 'package:ifood_app/src/validation/address_validator.dart';

class SignupController {
  
  static Future restaurante(String nome, String email, String password,
      String endereco, String categoria) async {
    
    if(!NameValidator.validate(nome))
      return {"usuario":[], "erro": "Nome inválido."};
    
    if(!EmailValidator.validate(email))
      return {"usuario":[], "erro": "Email inválido."};

    if(!PasswordValidator.validate(password))
      return {"usuario":[], "erro": "Senha inválida."};

    if(!AddressValidator.validate(endereco))
      return {"usuario":[], "erro": "Endereço inválido."};

    if(!NameValidator.validate(categoria))
      return {"usuario":[], "erro": "Categoria inválida."};
    
    Dio dio = Dio();

    try {
      var response = await dio.post("${ENV.BASE_URL}/restaurante/criar", data: {
        "nome": nome,
        "email": email,
        "senha": password,
        "endereco": endereco,
        "categoria": categoria,
        "provedor": true
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static Future cliente(
      String nome, String email, String password, String endereco) async {
    
    if(!NameValidator.validate(nome))
      return {"usuario":[], "erro": "Nome inválido."};
    
    if(!EmailValidator.validate(email))
      return {"usuario":[], "erro": "Email inválido."};

    if(!PasswordValidator.validate(password))
      return {"usuario":[], "erro": "Senha inválida."};

    if(!AddressValidator.validate(endereco))
      return {"usuario":[], "erro": "Endereço inválido."};
    
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
