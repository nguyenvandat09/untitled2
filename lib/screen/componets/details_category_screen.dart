import 'package:flutter/material.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/category.dart';
import 'package:untitled2/models/favorites.dart';
import 'package:untitled2/screen/componets/details_screen.dart';


// ignore: camel_case_types
class detailsCategoryScreen extends StatefulWidget {
  const detailsCategoryScreen({super.key, required this.category});
  final Category category;

  @override
  State<detailsCategoryScreen> createState() => _ProductGridItemState();
}
class _ProductGridItemState extends State<detailsCategoryScreen> {
  Future<List<Product>> fetchAlbum() async {

    final response = await http.get(
      //Uri.parse('http://localhost:8080/api/product'),
      Uri.parse('http://localhost:3000/api/product/getlistproductbycategory/${widget.category.id}'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );

    if (response.statusCode == 200) {

      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      //print(baseResponse.message);
      return (baseResponse.data as List?)
          ?.map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ?? [];

    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
        title: Text(
          "${widget.category.name}",
          style: const TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                color: const Color(0xFF40BFFF),
                icon: const Icon(Icons.search_outlined,size: 25,),
              ),
              IconButton(
                onPressed: () {},
                color: const Color(0xFF40BFFF),
                icon: const Icon(Icons.settings,size: 25,),
              )
            ],
          ),

        ],
      ),
      body:  SingleChildScrollView(
        child:Container(
          padding: const  EdgeInsets.all( 20),
          margin: const EdgeInsets.only(top: 20),
          child:  Center(
            child: FutureBuilder<List<Product>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
                    SizedBox(


                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () async {
                                bool statuses = false;
                                var responseLike = await http.get(
                                  Uri.parse(
                                      'http://localhost:3000/api/favorite/getStatusFavorite/${snapshot.data![index].id}'),
                                  headers: {
                                    "Content-Type": "application/json; charset=utf-8"
                                  },
                                );
                                var baseResponseLike = BaseResponse.fromJson(jsonDecode(utf8.decode(responseLike.bodyBytes)));
                                List<Favorites> listLike =
                                    (baseResponseLike.data as List?)
                                        ?.map((dynamic e) => Favorites.fromJson(e as Map<String, dynamic>)).toList() ?? [];
                                if(listLike.isNotEmpty) {
                                  for (int i = 0; i < listLike.length; i++) {
                                    if (listLike[i].idUser == id_) {

                                      statuses = true;
                                      print(statuses);
                                    }
                                  }
                                }
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(product: snapshot.data![index],statusFavorite: statuses),
                                  ),
                                );
                              },

                            child: Container(
                              //width: 140,
                              //height: 350,
                             // margin:const EdgeInsets.all(defaultPadding / 2),
                              padding: const EdgeInsets.all(defaultPadding / 2),
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
                                  Container(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                      snapshot.data![index].urlPicture.toString(),
                                      height: 132,
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  Text(
                                    snapshot.data![index].name.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  Text(
                                    "\$${snapshot.data![index].priceOld}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: 12,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  const SizedBox(height: defaultPadding / 2),
                                  Text(
                                    "\$${snapshot.data![index].price}",
                                    style: const TextStyle(

                                      color: Color(0xFF40BFFF),
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
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
          ),
        ),

      ),

    );
  }
}

