import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';
import 'package:ifood_app/src/validation/email_validator.dart';
import 'package:ifood_app/src/validation/password_validator.dart';

class LoginController {
  Dio dio = Dio();
  
  Future handleLogin(email, password) async {

    if(!EmailValidator.validate(email))
      return {};

    if(!PasswordValidator.validate(password))
      return {};

    try {
      var response = await dio.get("${ENV.BASE_URL}/usuario", queryParameters: {"email": email, "senha": password});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

}