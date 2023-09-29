import 'package:flutter/material.dart';

class Product {
   int? id;
   String? name;
   String? urlPicture;
   double? price;
   double?  priceOld;
   int? ratting;
   Color? bgColor;
   bool? isActive;
  Product({
       this.id,
       this.name,
       this.urlPicture,
       this.price,
       this.priceOld,
       this.ratting,
      this.bgColor = const Color(0xFFEFEFF2),
      required  this.isActive});
   Product.fromJson(Map<String, dynamic> json) {

      id= json['id'] ?? '';
      name= json['name'] ?? '';
      price=json['price'] ?? '';
      priceOld= json['priceOld'] ?? '';
      urlPicture= json['urlPicture'] ?? '';
      ratting= json['ratting'] ?? '';
      isActive= json['isActive'] ?? false;

  }
   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = <String, dynamic>{};
     data['id'] = id;
     data['name'] = name;
     data['price'] = price;
     data['priceOld'] = priceOld;
     data['urlPicture'] = urlPicture;
     data['ratting'] = ratting;
     data['isActive'] = isActive;
     return data;
   }

}


