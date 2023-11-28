import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'package:untitled2/models/favorites.dart';
import 'package:untitled2/screen/componets/details_screen.dart';
import '../../../constants.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ListGirdProducts extends StatelessWidget {

  const ListGirdProducts({
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
    var f = NumberFormat("#,##0", "en_US");
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
        ),
        Center(
          child: FutureBuilder<List<Product>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
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

                                }
                              }
                            }
                            // ignore: use_build_context_synchronously
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(product: snapshot.data![index],statusFavorite: statuses),
                              ),
                            );
                          },
                          child: Container(
                            height: 300,
                            padding: const EdgeInsets.all(defaultPadding / 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12.0)),
                              border: Border.all(
                                width: 1.0,
                                color: const Color(0xFFEFEFEF),
                              ),
                            ),
                            child:Center(
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
                                  const SizedBox(height: 6),
                                  Text(
                                    snapshot.data![index].name.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const SizedBox(height: 6),
                                 Container(
                                   margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 32 ),
                                   child: FivePointedStar(
                                     defaultSelectedCount: snapshot.data![index].ratting as int,
                                     count: 5,
                                     selectedColor: const Color(0xFFFFEB00),
                                     size: const Size(12, 12),
                                   ),
                                 ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "\$${f.format(snapshot.data![index].priceOld)}",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      textBaseline: TextBaseline.alphabetic,
                                      fontSize: 12,
                                      color: Color(0xFF808080),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                    const EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  Text(
                                    "\$${f.format(snapshot.data![index].price)}",
                                    style: const TextStyle(
                                      color: Color(0xFF40BFFF),
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              ),
                            )

                          ),

                      );
                      },

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