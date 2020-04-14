class CartItem {
  int id;
  int amount;
  String name;
  var price;
  var priceTotal;

  CartItem(this.name, this.price, this.id, this.amount) {
    this.priceTotal = price;
  }

  void incrementAmount() {
    this.amount++;
    this.priceTotal = this.amount * this.price;
  }
}