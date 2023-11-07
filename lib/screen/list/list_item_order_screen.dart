import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/orders.dart';
import 'package:untitled2/models/ordersItem.dart';
import 'package:untitled2/models/signRes.dart';

class ListItemOrdersScreen extends StatefulWidget {
  const ListItemOrdersScreen({super.key, required this.orders});
  final Orders orders;

  @override
  State<ListItemOrdersScreen> createState() => ListItemOrdersState();
}
class ListItemOrdersState extends State<ListItemOrdersScreen> {
  List<String> nameProduct = [];
  List<String> picturesProduct = [];
  List<String> priceProduct = [];
  int countItem =0;
  Future<List<OrdersItem>> fetchAlbum() async {

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/orders_item/getListOrderItemByIdOders/${widget.orders.idOrder}'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    List<OrdersItem> review = (baseResponse.data as List?)
        ?.map((dynamic e) => OrdersItem.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];

    http.Response response2;
    for (int i = 0; i < review.length; i++) {
      countItem++;
      response2 = await http.get(
        Uri.parse('http://localhost:3000/api/product/${review[i].id}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      var signInRes = SignInRes.fromJson(jsonDecode(response2.body));
      var product = Product.fromJson(signInRes.data!);

      nameProduct.add(product.name.toString());
      picturesProduct.add(product.urlPicture.toString());
      priceProduct.add(product.price.toString());
    }
    if (response.statusCode == 200) {
      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      //print(baseResponse.message);
      return (baseResponse.data as List?)
          ?.map((dynamic e) => OrdersItem.fromJson(e as Map<String, dynamic>))
          .toList() ?? [];

    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
        title: const Text(
          "Details Order",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child:Container(
          color:  Colors.white,
          margin: const EdgeInsets.only(top: 20),
            padding: const  EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              const Row(
                children: [
                   Text(
                    "Product",
                    textAlign: TextAlign.left,
                    style:  TextStyle(
                        fontSize: 18,
                        color: Color(0xFF223263)),
                  ),
                ],
              ),

              FutureBuilder<List<OrdersItem>>(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return
                      SizedBox(
                        width: 400,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(12),
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                border: Border.all(
                                  width: 1.0,
                                  color: const Color(0xFFEFEFEF),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [

                                      Container(
                                        margin:const EdgeInsets.all(5),
                                        child:  Image.network(
                                          picturesProduct[index].toString(),
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            nameProduct[index].toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF0E0E0E)),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "\$${priceProduct[index].toString()}",
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Color(0xFF40BFFF)),
                                          ),
                                        ],
                                      )
                                    ],),
                                  Container(

                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.fromLTRB(0,0,10,60),
                                    child: Text(
                                      "X ${snapshot.data![index].quantity}",
                                      style:const  TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFF223263)
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                            );
                          },
                        ),
                      );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
                const Row(
                  children: [
                    Text(
                      "Order Details",
                      textAlign: TextAlign.left,
                      style:  TextStyle(
                          fontSize: 18,
                          color: Color(0xFF223263)),
                    ),
                  ],
                ),
              Container(
                margin:const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                height: 290,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFEFEFEF),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      children: [
                        const Text(
                          "Date Order",
                          style: TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          " ${widget.orders.timeOder.toString().substring(0,10)}",

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
                          "Status Shipping",
                          style: TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          widget.orders.status,
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
                          "Address",
                          style: TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 80,
                          child:  Text(

                            address_,
                            style: const TextStyle(
                              color: Color(0xFF223263),
                              fontSize: 14,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
                Container(
                  margin:const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(20),
                  height: 150,
                  decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xFFEFEFEF),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                           Text(
                            "Items($countItem)",
                            style:const  TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$${widget.orders.price}",
                            style: const TextStyle(
                              color: Color(0xFF223263),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          Text(
                            "Shipping ",
                            style: TextStyle(
                              color: Color(0xFF9098B1),
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$40",
                            style: TextStyle(
                              color: Color(0xFF223263),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 7),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween,
                        children: [
                          const Text(
                            "Total Price",
                            style: TextStyle(
                              color: Color(0xFF223263),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                          "\$${widget.orders.price+40}",
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

            ],),
        ),

      ),

    );
  }
}

