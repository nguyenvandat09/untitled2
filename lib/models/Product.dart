class Product {
  final int? id;
  final int? idCategory;
  final String? name;
  final double? price;
  final double? priceOld;
  final String? urlPicture;
  final int? ratting;
  final bool? isActive;

  Product({
    this.id,
    this.idCategory,
    this.name,
    this.price,
    this.priceOld,
    this.urlPicture,
    this.ratting,
    this.isActive,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        idCategory = json['idCategory'] as int?,
        name = json['name'] as String?,
        price = json['price'] as double?,
        priceOld = json['priceOld'] as double?,
        urlPicture = json['urlPicture'] as String?,
        ratting = json['ratting'] as int?,
        isActive = json['isActive'] as bool?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'idCategory' : idCategory,
    'name' : name,
    'price' : price,
    'priceOld' : priceOld,
    'urlPicture' : urlPicture,
    'ratting' : ratting,
    'isActive' : isActive
  };
}