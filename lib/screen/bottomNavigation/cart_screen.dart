import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/screen/componets/cart_list_items.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/cart_item.dart';
import 'package:untitled2/models/orders.dart';
import 'package:untitled2/models/signRes.dart';
import 'package:untitled2/provider/cart_provider.dart';
import 'package:untitled2/screen/success_screen.dart';
import 'bottom_navigation_bar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CardItemState();
  const CartScreen({Key? key}) : super(key: key);
}
class _CardItemState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: SizedBox(
            height: 500,
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                final List<CartItem> cartItems = cartProvider.cartItems;
                if (cartItems.isEmpty) {
                  return Center(
                      child: Column(
                    children: [
                      const Icon(
                        Icons.remove_shopping_cart_outlined,
                        color: Color(0xFF40BFFF),
                        size: 80,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Your cart is empty',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ));
                } else {
                  return ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return Dismissible(
                        key: Key(cartItem.product.id.toString()),
                        // Use a unique key for each item
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 16.0),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeCartItem(index);
                        },
                        child: GestureDetector(
                            onTap: () {},
                            child: CartListItem(
                              cartItem: cartItem,
                              index: index,
                            )),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Container(
            height: 230,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Container()),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .clearCart();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF40BFFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: const Text(
                        "Clear Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Total Price:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Expanded(child: Container()),
                    Text(
                      '\$${cartProvider.totalPrice.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFF40BFFF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4C2E84).withOpacity(0.2),
                              offset: const Offset(0, 15.0),
                              blurRadius: 60.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'Shopping',
                          style: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final List<CartItem> cartItems2 =
                            cartProvider.cartItems;
                        if (cartItems2.isNotEmpty) {
                          //var timeNowFormated=DateFormat('yyyy-MM-ddTHH:mm:ss.000+00:00').format(DateTime.now()) ;
                          var timenow = DateTime.now();
                          var response = await http.post(
                              Uri.parse('http://localhost:3000/api/orders'),
                              body: json.encode({
                                'idUser': id_,
                                'status': "Shipping",
                                'price': cartProvider.totalPrice,
                                'createAt': timenow.toString(),
                                'countItem': cartItems2.length
                              }),
                              headers: {'Content-Type': 'application/json'});
                          var signInRes =
                              SignInRes.fromJson(jsonDecode(response.body));
                          var orders = Orders.fromJson(signInRes.data!);
                          int idOrder = orders.idOrder;

                          for (int i = 0; i < cartItems2.length; i++) {
                            var responseOrderItem = await http.post(
                                Uri.parse(
                                    'http://localhost:3000/api/orders_item'),
                                body: json.encode({
                                  'idOrders': idOrder,
                                  'quantity': cartItems2[i].quantity,
                                  'idProduct': cartItems2[i].product.id,
                                }),
                                headers: {'Content-Type': 'application/json'});
                            jsonDecode(responseOrderItem.body);
                          }
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const successScreen()),
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xFF40BFFF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF4C2E84).withOpacity(0.2),
                              offset: const Offset(0, 15.0),
                              blurRadius: 60.0,
                            ),
                          ],
                        ),
                        child: Text(
                          'Check out',
                          style: GoogleFonts.inter(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
