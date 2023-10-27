
class OrdersItem {
  final int id;
  final int idOrders;
  final int idProduct;
  final int quantity;

  OrdersItem({

    required this.id,
    required this.idOrders,
    required this.idProduct,
    required this.quantity,
  });

  factory OrdersItem.fromJson(Map<String, dynamic> json) {
    return OrdersItem(
      id: json['id'] ?? '',
      idOrders: json['idOrders'] ?? '',
      idProduct:json['idProduct'] ?? '',
      quantity: json['quantity'] ?? '',
    );
  }

}
