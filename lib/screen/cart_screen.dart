import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/screen/componets/cart_list_items.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/cart_item.dart';
import 'package:untitled2/models/orders.dart';
import 'package:untitled2/models/signRes.dart';
import 'package:untitled2/provider/cart_provider.dart';
import 'bottom_navigation_bar.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CardItemState();
  const CartScreen({Key? key, required this.product}) : super(key: key);
  final Product product;
}
late double price_;
late  int idProduct;
Future addOrder() async{
  var timeNowFormated=DateFormat('yyyy-MM-ddTHH:mm:ss.000+00:00').format(DateTime.now()) ;

  var response = await http.post(
      Uri.parse('http://localhost:3000/api/orders'),
      body: json.encode(
        {'idUser': id_, 'status' : "Shipping", 'price': price_, 'createAt':timeNowFormated,}
      ),
      headers: {
        'Content-Type': 'application/json'
      }
  );
  var signInRes = SignInRes.fromJson(jsonDecode(response.body));
  var orders = Orders.fromJson(signInRes.data!);
  int idOrder=orders.idOrder;

  var responseOrderItem = await http.post(
      Uri.parse('http://localhost:3000/api/orders_item'),
      body: json.encode(
          {'idOrders': idOrder, 'quantity': 1, 'idProduct':idProduct,}
      ),
      headers: {
        'Content-Type': 'application/json'
      }
  );
  jsonDecode(responseOrderItem.body);
}
class _CardItemState extends State<CartScreen> {

   final List<CartItem> _cartItems = [];
  @override
  Widget build(BuildContext context) {
    price_=widget.product.price as double;
    idProduct=widget.product.id!;
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(color: Color(0xFF40BFFF)),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          // final List<CartItem> cartItems =
                          //     cartProvider.cartItems;
                          CartItem cartitem = CartItem(product: widget.product);
                          _cartItems.add(cartitem);
                          List<CartItem> cartItems = _cartItems;

                          if (cartItems.isEmpty) {
                            return Center(
                              child: Text(
                                'Your cart is empty.',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          }
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
                                  Provider.of<CartProvider>(context,
                                          listen: false)
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
                        },
                      ),
                    ),
                    Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  ElevatedButton(
                                    onPressed: () {
                                      _cartItems.clear();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF40BFFF),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    '\$${widget.product.price?.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    if (_cartItems.isNotEmpty) {
                      addOrder();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
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
                //button checkout
              ],
            ),
          ),
        ),
      ),
    );
  }
}
