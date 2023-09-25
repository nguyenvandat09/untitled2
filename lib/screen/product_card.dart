import '../../../constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.press,
    required this.bgColor,
    required this.Discount,
  }) : super(key: key);
  final String image, title;
  final VoidCallback press;
  final int price;
  final Color bgColor;
  final double Discount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 154,
        padding: const EdgeInsets.all(defaultPadding / 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: const BorderRadius.all(
                    Radius.circular(12.0)),
              ),
              child: Image.asset(
                image,
                height: 132,
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            Column(
              children: [
                Text(
                    title,
                    style: const TextStyle(color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2 ),

                ),
                Text(
                  "\$$price",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF40BFFF),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2 ),

                ),
                Text(
                   "$Discount % OFF",
                  style: const TextStyle(

                    color: Color(0xFFF84444),
                    fontSize: 13,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}