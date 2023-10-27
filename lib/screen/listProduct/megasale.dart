import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/favorites.dart';
import '../../../../constants.dart';
import '../../models/base_response.dart';
import 'package:untitled2/models/section_title.dart';
import 'package:untitled2/screen/componets/details_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MegaProducts extends StatelessWidget {
  const MegaProducts({
    Key? key,
  }) : super(key: key);
  Future<List<Product>> fetchAlbum() async {
    final response = await http.get(
      //Uri.parse('http://localhost:8080/api/product'),
      Uri.parse('http://localhost:3000/api/product'),
      headers: {"Content-Type": "application/json; charset=utf-8"},);

    if (response.statusCode == 200) {

      //var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));
      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      List<Product> product = (baseResponse.data as List?)?.map((dynamic e) => Product.fromJson(e as Map<String,dynamic>)).toList() ??[];

      for (int i = 0; i < product.length; i++) {
        if(product[i].ratting! < 4){
          product.removeAt(i);

        }
      }
      return product;
      //return (baseResponse.data as List?)?.map((dynamic e) => Product.fromJson(e as Map<String,dynamic>)).toList() ??[];
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Popular product",
            pressSeeAll: () {},
          ),
        ),
        Center(
          child: FutureBuilder<List<Product>>(
            future: fetchAlbum(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 215,
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
                          width: 154,
                          padding: const EdgeInsets.all(defaultPadding / 2),
                          margin: const EdgeInsets.only(left: 15),
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius:const  BorderRadius.all(Radius.circular(12.0)),
                            border: Border.all(
                              width: 1.2,
                              color: const Color(0xFFEFEFEF),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: bgColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12.0)),
                                ),
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
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4 ,horizontal: 27),
                                child: FivePointedStar(
                                  defaultSelectedCount: snapshot.data![index].ratting as int,
                                  count: 5,
                                  selectedColor: const Color(0xFFFFEB00),
                                  size: const Size(12, 12),
                                ),
                              ),

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
        )
      ],
    );
  }
}