import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/orders.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/screen/list/list_item_order_screen.dart';
import '../../models/base_response.dart';
import 'package:intl/intl.dart';

class ListOrders extends StatelessWidget {
  const ListOrders({Key? key,}) : super(key: key);
  Future<List<Orders>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/orders/getordersbyiduser/$id_'),
      headers: {"Content-Type": "application/json; charset=utf-8"},);
    List<Orders> listOrder;
    if (response.statusCode == 200) {
      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
     listOrder=  (baseResponse.data as List?)?.map((dynamic e) => Orders.fromJson(e as Map<String,dynamic>)).toList() ??[];
    } else {
      throw Exception('Failed to load data');
    }
    return listOrder.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat("#,##0", "en_US");
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xFFFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Color(0xFF223263),
            size: 30,
          ),
        ),
        title:  const Text(
          "History Order",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body:  Container(
        margin: const EdgeInsets.all(20),
          child: FutureBuilder<List<Orders>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if(snapshot.data!.isEmpty) {
                      return SizedBox(
                        height: 200,

                        child: Column(
                          children: [
                            const Text(
                              "Your order is Empty ",
                              style: TextStyle(
                                color: Color(0xFF223263),
                                fontSize: 18,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 65,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFF40BFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF4C2E84)
                                          .withOpacity(0.2),
                                      offset: const Offset(0, 15.0),
                                      blurRadius: 60.0,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Go Shopping',
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
                      );
                    }else {
                        return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListItemOrdersScreen(orders: snapshot.data![index],),
                            ),
                          );
                        },
                        child:
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(15),
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 1.0,
                              color: const Color(0xFFEFEFEF),
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${snapshot.data![index].idOrder}",
                                style: const TextStyle(
                                  color: Color(0xFF223263),
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8),
                              ),
                              Text(
                                "Order at: ${snapshot.data![index].timeOder
                                    .toString().substring(0, 10)}",
                                style: const TextStyle(
                                  color: Color(0xFF9098B1),
                                  fontSize: 14,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  const Text(
                                    "Status:",
                                    style: TextStyle(
                                      color: Color(0xFF9098B1),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    " ${snapshot.data![index].status}",
                                    style: const TextStyle(
                                      color: Color(0xFF223263),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  const Text(
                                    "Item :",
                                    style: TextStyle(
                                      color: Color(0xFF9098B1),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![index].countItem}",
                                    style: const TextStyle(
                                      color: Color(0xFF223263),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  const Text(
                                    "Price:",
                                    style: TextStyle(
                                      color: Color(0xFF9098B1),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "\$${f.format(snapshot.data![index].price)}",
                                    style: const TextStyle(
                                      color: Color(0xFF40BFFF),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      );
                      }
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),



      ),
    );



  }
}
