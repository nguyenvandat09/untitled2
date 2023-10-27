import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/favorites.dart';
import 'package:untitled2/screen/componets/details_screen.dart';

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchTerms = [];
  List<Product> product_ = [];
  Future fetchAlbum() async {
    if(searchTerms.isEmpty) {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/product'),
      headers: {"Content-Type": "application/json; charset=utf-8"}  ,);
      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      List<Product> product= (baseResponse.data as List?)?.map((dynamic e) => Product.fromJson(e as Map<String,dynamic>)).toList() ??[];
        for (int i = 0; i < product.length; i++) {
          searchTerms.add(product[i].name.toString());
        }
        product_= product;

    }

  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';

        },
        icon: const Icon(Icons.clear,color: Color(0xFF40BFFF),),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back,color: Color(0xFF40BFFF)),
    );
  }


  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toUpperCase().contains(query.toUpperCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result,style:const TextStyle(
              color: Color(0xFF9098B1)
          ))
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    fetchAlbum();
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toUpperCase().contains(query.toUpperCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
            child:ListTile(
              hoverColor: const Color(0xFF40BFFF),
              title: GestureDetector(
                onTap: () async {
                  bool statuses = false;
                  var responseLike = await http.get(
                    Uri.parse(
                        'http://localhost:3000/api/favorite/getStatusFavorite/${product_[index].id}'),
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
                      builder: (context) => DetailsScreen(product: product_[index],statusFavorite: statuses),
                    ),
                  );
                },
                child: Text(
                    result,
                    style:const TextStyle(
                  color: Color(0xFF9098B1)
                )) ,
              ),
            ),
        );
      },
    );
  }
}
