import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'package:untitled2/models/favorites.dart';
import 'package:untitled2/screen/componets/details_screen.dart';
import '../../../../constants.dart';
import 'dart:convert';
import 'dart:async';
import 'package:untitled2/models/section_title.dart';
import 'package:http/http.dart' as http;

class FlashSaleProducts extends StatelessWidget {

  const FlashSaleProducts({
    Key? key,
  }) : super(key: key);

  Future<List<Product>> fetchAlbum() async {

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/product'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );

    if (response.statusCode == 200) {

      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return (baseResponse.data as List?)
              ?.map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
              .toList() ?? [];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: SectionTitle(
              title: "Flash Sale",
              pressSeeAll: () {},
            ),
          ),
          Center(
            child: FutureBuilder<List<Product>>(
              future: fetchAlbum(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
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
                              width: 170,
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              margin: const EdgeInsets.only(left: 15),
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                                border: Border.all(
                                  width: 1.2,
                                  color: const Color(0xFFEFEFEF),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
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
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: const Color(0xFF223263),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 2 ),
                                  ),
                                  Text(
                                    "\$${snapshot.data![index].priceOld}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: 12,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 2 ),

                                  ),
                                  Text(
                                    "\$${snapshot.data![index].price}",
                                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                      color: const Color(0xFF40BFFF),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
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
          )
        ],

    );
  }
}