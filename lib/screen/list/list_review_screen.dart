import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/like_status.dart';
import 'package:untitled2/models/reviews.dart';
import 'package:untitled2/models/signRes.dart';
import 'package:untitled2/models/user.dart';
import 'package:untitled2/screen/bottomNavigation/bottom_navigation_bar.dart';
import 'package:untitled2/screen/componets/details_screen.dart';
import 'package:untitled2/screen/list/list_reply_screen.dart';
import 'package:untitled2/screen/write_review_screen.dart';
import 'package:like_button/like_button.dart';

// ignore: camel_case_types
class HomeListReviewPage extends StatelessWidget {
  const HomeListReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListReviewScreen(),
    );
  }
}
class ListReviewScreen extends StatefulWidget {
  const ListReviewScreen({super.key});
  @override
  State<ListReviewScreen> createState() => ListReviewState();
}

class ListReviewState extends State<ListReviewScreen> {
  bool statusLike = false;
  bool isVisible = true;
  List<String> nameuser = [];
  List<String> picturesReview = [];

  Future<List<Review>> fetchAlbum() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/reviews/getListReviewsByProduct/$idProduct_'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    List<Review> review = (baseResponse.data as List?)
            ?.map((dynamic e) => Review.fromJson(e as Map<String, dynamic>))
            .toList() ?? [];
    // var signInRes = SignInRes.fromJson(jsonDecode(response.body));
    // var reviewz = Review.fromJson(signInRes.data!);
    http.Response response2;

    for (int i = 0; i < review.length; i++) {
      response2 = await http.get(
        Uri.parse('http://localhost:3000/api/user/${review[i].idUser}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      var signInRes = SignInRes.fromJson(jsonDecode(response2.body));
      var user = User.fromJson(signInRes.data!);

      nameuser.add(user.name);
      picturesReview.add(user.avatarUser);

    }

    if (response.statusCode == 200) {

      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      //print(baseResponse.message);
       List<Review> reviewReverse = (baseResponse.data as List?)
          ?.map((dynamic e) => Review.fromJson(e as Map<String, dynamic>))
          .toList() ?? [];
       /// Reverse list review
      // for(var i=0;i<reviewReverse.length/2;i++){
      //   var temp = reviewReverse[i];
      //   reviewReverse[i] = reviewReverse[reviewReverse.length-1-i];
      //   reviewReverse[reviewReverse.length-1-i] = temp;
      // }

      return reviewReverse;
    } else {
      throw Exception('Failed to load data');
    }

  }
  Future deleteReview(String idDelete) async {
    final response = await http.delete(
      Uri.parse('http://localhost:3000/api/reviews/$idDelete'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    // ignore: avoid_print
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
          "Review",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),

      ),
      body:  SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              FutureBuilder<List<Review>>(
                future: fetchAlbum(),
                builder: (context, snapshot) {

                  if (snapshot.hasData) {
                    return
                      SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {

                            if(snapshot.data![index].idUser == id_){
                              isVisible =true;
                            }else{
                              isVisible =false;
                            }
                            return  Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(15),

                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            ClipOval(
                                              child: Image.network(
                                                picturesReview[index],
                                                width: 63.0,
                                                height: 63.0,
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.symmetric(horizontal: 3),
                                            ),
                                            Column(
                                              children:  [
                                                Text(
                                                  nameuser[index],
                                                  style:const  TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF223263)
                                                  ),
                                                ),
                                                FivePointedStar(
                                                  defaultSelectedCount:snapshot.data![index].ratting as int ,
                                                  count: 5,
                                                  selectedColor:const Color(0xFFFFEB00) ,
                                                  size: const Size(15,15),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isVisible,
                                          child: IconButton(
                                            icon: const Icon(Icons.delete_outline),
                                            color: const Color(0xFF40BFFF),
                                            iconSize: 21,
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: const Text('Notification'),
                                                    content: const Text('Do you want to remove review ?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          deleteReview( snapshot.data![index].id.toString());
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) => const HomeListReviewPage(),
                                                            ),
                                                          );
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
                                          ),
                                        ),

                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 4),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          " ${snapshot.data![index].createdAts.toString().substring(0,10)}",
                                          style: const TextStyle(
                                            color: Color(0xFF9098B1),
                                            fontSize: 13,
                                          ),
                                        ),
                                        const Text(""),
                                      ],
                                    ),

                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                    ),
                                    Text(
                                      " ${snapshot.data![index].contents.toString()}",
                                      style: const TextStyle(
                                        color: Color(0xFF9098B1),
                                        fontSize: 14,
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                    ),
                                    Row(
                                      children: [
                                        Image.network(
                                          snapshot.data![index].pictureReview.toString(),
                                          width: 60.0,
                                          height: 60.0,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 2),
                                        ),
                                        Image.network(
                                          snapshot.data![index].pictureReview.toString(),
                                          width: 60.0,
                                          height: 60.0,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        LikeButton(
                                          size: 20,
                                          circleColor: const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor: Color(0xff33b5e5),
                                            dotSecondaryColor: Color(0xff0099cc),
                                          ),
                                          likeBuilder: (bool liked) {
                                            if (snapshot.data![index].idUser == id_){
                                              liked= true;
                                            }
                                            return SvgPicture.network(
                                              'https://www.svgrepo.com/show/512408/like-1386.svg',
                                              color: liked ? Colors.blue : Colors.grey,
                                              cacheColorFilter: true,
                                              height: 20,
                                              width: 20,
                                            );
                                          },
                                          likeCount: snapshot.data![index].likeCount!+1,
                                          // onTap: (bool isLiked) async {
                                          //   if (isLiked == false) {
                                          //     var responseOrderItem = await http.post(
                                          //         Uri.parse(
                                          //             'http://localhost:3000/api/like_status'),
                                          //         body: json.encode({
                                          //           'idReview': snapshot.data![index].id,
                                          //           'statusLike': id_,
                                          //         }),
                                          //         headers: {
                                          //           'Content-Type':
                                          //               'application/json'
                                          //         });
                                          //    jsonDecode(responseOrderItem.body);
                                          //
                                          //   }
                                          //   return null;
                                          // },
                                        ),

                                        Row(
                                          children: [
                                           const Text(
                                              "Reply",
                                              style:  TextStyle(
                                                color: Color(0xFF40BFFF),
                                                fontSize: 13,
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.navigate_next,
                                                color: Color(0xFF40BFFF),
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                       ListReplyScreen(review: snapshot.data![index],avatar: picturesReview[index],nameUser: nameuser[index],)),
                                                );
                                              },
                                            ),
                                        ],),


                                      ],),


                                  ],
                                ),

                              );

                          },
                        ),
                      );
                  }
                  else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              Container(margin:const EdgeInsets.all(10),)
            ],
          ),


        ),

      ),
      bottomNavigationBar: Container(
        margin:const EdgeInsets.fromLTRB(16, 20, 16, 20),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 53,
          child: ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddReviewScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              //shape: const StadiumBorder()
            ),
            child: const Text("Write Review"),
          ),
        ),
      ),
    );
  }
}
bool status = false;
Future listLikeStatus(int id) async {

  final responseLike = await http.get(
    Uri.parse(
        'http://localhost:3000/api/like_status/getStatusLike/$id'),
    headers: {
      "Content-Type": "application/json; charset=utf-8"
    },
  );
  var baseResponseLike = BaseResponse.fromJson(jsonDecode(utf8.decode(responseLike.bodyBytes)));
  List<LikeStatus> listLike =
      (baseResponseLike.data as List?)
          ?.map((dynamic e) => LikeStatus.fromJson(e as Map<String, dynamic>)).toList() ?? [];

  if(listLike.isNotEmpty) {
    for (int i = 0; i < listLike.length; i++) {
      if (listLike[i].idReview == id) {
        if (listLike[i].statusLike == id_) {
          status = true;
        }
      }
    }
  }
  return status;
}


