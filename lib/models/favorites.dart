
class Favorites {
  final int id;
  final int idProduct;
  final int idUser;

  Favorites({

    required this.id,
    required this.idProduct,
    required this.idUser,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) {
    return Favorites(
      id: json['id'] ?? '',
      idProduct: json['idProduct'] ?? '',
      idUser: json['idUser'] ?? '',
    );
  }

}