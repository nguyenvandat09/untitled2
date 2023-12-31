
class Orders {
  final int idOrder;
  final int idUser;
  final String status;
  final double price;
  final String? timeOder;
  final int countItem;
  Orders({
    required this.idOrder,
    required this.idUser,
    required this.status,
    required this.price,
    required this.timeOder,
    required this.countItem,
  });

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      idOrder: json['id'] ?? '',
      idUser: json['idUser'] ?? '',
      status:json['status'] ?? '',
      price: json['price'] ?? '',
      timeOder: json['createAt'] ?? '',
        countItem : json['countItem'] ?? '',
    );
  }

}
