import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final Color bgColor;
  final double Discount;

  Product({
    required this.image,
    required this.title,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
    required this.Discount,
  });
}

List<Product> demo_product = [
  Product(
    image: "assets/product.png",
    title: "Long Sleeve Shirts",
    price: 165,
    bgColor: const Color(0xFFEFEFF2),
    Discount: 12,
  ),
  Product(
    image: "assets/product.png",
    title: "Long Sleeve Shirts",
    price: 99,
    bgColor: const Color(0xFFEFEFF2),
    Discount: 12,
  ),
  Product(
    image: "assets/product.png",
    title: "Long Sleeve ",
    price: 170,
    bgColor: const Color(0xFFEFEFF2),
    Discount: 25,
  ),
  Product(
    image: "assets/product.png",
    title: "Long Sleeve ",
    price: 190,
    bgColor: const Color(0xFFEFEFF2),
    Discount: 25,
  ),
];