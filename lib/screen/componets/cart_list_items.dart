
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/models/cart_item.dart';
import '../../../provider/cart_provider.dart';

class CartListItem extends StatefulWidget {
  final CartItem cartItem;
  final int index;
  const CartListItem({super.key, required this.cartItem, required this.index});

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  String currency = "₦";
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
             widget.cartItem.product.urlPicture!,
              fit: BoxFit.cover,
              width: 67,
              height: 100,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: SizedBox(
              width: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.only(top: 10),),
                  Text(
                    widget.cartItem.product.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${widget.cartItem.product.price.toString()}",
                        style: GoogleFonts.inter(
                          fontSize: 16.0,
                          color: const Color(0xFF40BFFF),
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF40BFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              iconSize: 16,
                              onPressed: () {
                                if (quantity >= 1) {
                                  Provider.of<CartProvider>(context,
                                      listen: false)
                                      .decreaseCartItemQuantity(widget.index);
                                }
                              },
                            ),
                          ),

                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            widget.cartItem.quantity.toString(),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF40BFFF),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  blurRadius: 1.0,
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              iconSize: 16,
                              onPressed: () {
                                Provider.of<CartProvider>(context,
                                    listen: false)
                                    .increaseCartItemQuantity(widget.index);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
