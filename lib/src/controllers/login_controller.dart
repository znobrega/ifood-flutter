import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class LoginController {
  Dio dio = Dio();
  
  Future handleLogin(email, password) async {
    try {
      var response = await dio.get("${ENV.BASE_URL}/usuario", queryParameters: {"email": email});
      return response.data;
    } catch (e) {
      print(e);
    }
  }

}