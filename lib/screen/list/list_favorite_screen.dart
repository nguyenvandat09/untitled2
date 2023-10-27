import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/favorites.dart';
import 'package:untitled2/models/signRes.dart';
import 'package:untitled2/screen/bottom_navigation_bar.dart';
import 'package:untitled2/screen/componets/details_screen.dart';

class ListFavoriteScreen extends StatelessWidget {
  const ListFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListFavoriteScreenState();
  }
}

class ListFavoriteScreenState extends StatefulWidget {
  const ListFavoriteScreenState({super.key});


  @override
  State<ListFavoriteScreenState> createState() => ListFavoriteState();
}
class ListFavoriteState extends State<ListFavoriteScreenState> {

  Future<List<Product>> fetchAlbum() async {



    final response = await http.get(
      //Uri.parse('http://localhost:8080/api/product'),
      Uri.parse('http://localhost:3000/api/favorite/listFavoriteByUser/$id_'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );

      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      //print(baseResponse.message);
      return (baseResponse.data as List?)
          ?.map((dynamic e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ?? [];
  }
  Future deleteFavorite(int? idProduct) async {

    var response1 = await http.post(

        Uri.parse('http://localhost:3000/api/favorite/getIdByFavorite'),// Nodejs
        body: json.encode({'idProduct':idProduct, 'idUser':id_ }),
        headers: {'Content-Type': 'application/json'});
    var signInRes = SignInRes.fromJson(jsonDecode(response1.body));
    var favorite = Favorites.fromJson(signInRes.data!);


    final response = await http.delete(
      Uri.parse('http://localhost:3000/api/favorite/${favorite.id}'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    print(response);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading:IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Color(0xFF40BFFF),
            size: 30,
          ),
        ),
        title: const Text(
          "Favorite Product",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 16,
          ),
        ),

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
                  return  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return
                        GestureDetector(
                          onLongPress: () async{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return
                                  AlertDialog(
                                    title: const Text('Notification'),
                                    content: const Text('Do you want to remove favorite product ?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, true);

                                          setState(() {
                                            deleteFavorite(snapshot.data![index].id);
                                            snapshot.data!.removeAt(index);
                                          });

                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        child: const Text('No'),
                                      ),
                                    ],

                                );
                              },
                            );
                          },
                          onTap: () async {
                            bool statuses = false;
                            var responseLike = await http.get(
                              Uri.parse(
                                  'http://localhost:3000/api/favorite/getStatusFavorite/${snapshot.data![index].id}'),
                              headers: {
                                "Content-Type": "application/json; charset=utf-8"
                              },
                            );
                            var baseResponseLike = BaseResponse.fromJson(
                                jsonDecode(
                                    utf8.decode(responseLike.bodyBytes)));
                            List<Favorites> listLike =
                                (baseResponseLike.data as List?)
                                        ?.map((dynamic e) => Favorites.fromJson(
                                            e as Map<String, dynamic>))
                                        .toList() ??
                                    [];
                            if (listLike.isNotEmpty) {
                              for (int i = 0; i < listLike.length; i++) {
                                if (listLike[i].idUser == id_) {
                                  statuses = true;
                                  print(statuses);
                                }
                              }
                            }
                            // ignore: use_build_context_synchronously
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsScreen(
                                    product: snapshot.data![index],
                                    statusFavorite: statuses),
                              ),
                            );
                          },
                          child: Container(
                              height: 300,
                              padding: const EdgeInsets.all(defaultPadding / 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0)),
                                border: Border.all(
                                  width: 1.1,
                                  color: const Color(0xFFEFEFEF),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Image.network(
                                        snapshot.data![index].urlPicture
                                            .toString(),
                                        height: 132,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      snapshot.data![index].name.toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 32),
                                      child: FivePointedStar(
                                        defaultSelectedCount: snapshot
                                            .data![index].ratting as int,
                                        count: 5,
                                        selectedColor: const Color(0xFFFFEB00),
                                        size: const Size(12, 12),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2),
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
                              )),
                        );
                    },

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

