import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:ifood_app/src/controllers/cart_controller.dart';
import 'package:ifood_app/src/models/cart_item.dart';
import 'package:rxdart/rxdart.dart';

class BlocCart extends BlocBase {
  var _cartItems = BehaviorSubject<List<CartItem>>();

  List<CartItem> items;
  double totalPrice;

  Observable<List<CartItem>> get cartItems => _cartItems.stream;

  void addItem(CartItem newItem) {
    if (items == null) {
      items = [newItem];
    } else {
      var result =
          items.firstWhere((item) => item.id == newItem.id, orElse: () => null);
      int i = items.indexOf(result);
      print("Resultado da busta: $i");
      print(result);

      if (result != null) {
        result.incrementAmount();
      } else {
        items.add(newItem);
      }
    }

    _cartItems.sink.add(items);
  }

  void decrementAmount(int index) {
    items[index].amount--;
    items[index].priceTotal = items[index].amount * items[index].price;

    if (items[index].amount <= 0) {
      items.removeAt(index);
    }

    _cartItems.sink.add(items);
  }

  void sendPedido(
      double total, int idRestaurante, int idCliente, String endereco) async {
    CartController cartController = CartController();
    print("========SUBMIT PEDIDO======");
    print("Total: $total");
    print("restaurante: $idRestaurante");
    print("cliente: $idCliente");
    print("endereco: $idCliente");
    print("Items originais: $items");
    print("Items originais: $items");
    print("--==========================--");

    List copy = List.from(items);

    try {
      var res = await cartController.createPedido(idRestaurante, idCliente);
      print("=======================");
      print(res["pedido"]["id"]);
      print("=======================");

      copy.forEach((item) async {
      try {
        var newfood = await cartController.insertFood(
            res["pedido"]["id"], item.id, item.amount);
        print("novacomida: $newfood");
      } catch (err) {
        print(err);
      }
    });

      // List list = await
      // Future.wait(items.map(
      //         (item) => cartController.createPedido(idRestaurante, idCliente)))
      //     .then((value) {
      //   print(value);
      //   clearList();
      // });

      var preco = await cartController.totalPrice(res["pedido"]["id"], total);
      print(preco);
      clearList();
      print("Items originais FINAL: $items");
      print("Items COPIA: $copy");
    } catch (err) {
      print(err);
    }
  }

  void clearList() {
    items = [];
    _cartItems.sink.add(items);
  }

  double valueTotal() {
    double total = 0;
    if (items == null || items.length == 0) {
      return total;
    }

    items.forEach((item) {
      if (item != null) {
        total += item.priceTotal;
      }
    });

    return total;
  }

  @override
  void dispose() {
    _cartItems.close();
    super.dispose();
  }
}
