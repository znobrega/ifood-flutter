import 'package:dio/dio.dart';
import 'package:ifood_app/src/env/env.dart';

class CartController {
  Dio dio = Dio();
  
  Future createPedido(idRestaurante, idCliente, String tipoEntrega) async {
    try {
      var response = await dio.post("${ENV.BASE_URL}/pedido/criar", 
      data: {
        "id_restaurante": idRestaurante,
        "id_cliente": idCliente,
        "tipo_entrega": tipoEntrega
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future totalPrice(int idPedido, double precoTotal, String tipoEntrega) async {
    try {
      var response = await dio.put("${ENV.BASE_URL}/pedido/atualizarprecototal", 
      data: {
        "id_pedido": idPedido,
        "preco_total": precoTotal,
        "tipo_entrega": tipoEntrega
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  Future insertFood(idPedido, idComida, quantidade, preco_comida) async {
    try {
      var response = await dio.post("${ENV.BASE_URL}/detalhes_pedido/inserircomida", 
      data: {
        "id_pedido": idPedido,
        "id_comida": idComida,
        "preco": preco_comida,
        "quantidade": quantidade
      });
      return response.data;
    } catch (e) {
      print(e);
    }
  }

}