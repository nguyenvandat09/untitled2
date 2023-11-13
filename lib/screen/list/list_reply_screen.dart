import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/base_response.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:untitled2/models/reply.dart';
import 'package:untitled2/models/reviews.dart';
import 'package:untitled2/models/signRes.dart';
import 'package:untitled2/models/user.dart';
import 'package:untitled2/screen/bottomNavigation/bottom_navigation_bar.dart';

class ListReplyScreen extends StatefulWidget {
  const ListReplyScreen({super.key, required this.review, required this.avatar , required this.nameUser});
  final Review review;
  final String nameUser;
  final String avatar;

  @override
  State<ListReplyScreen> createState() => ListReplyState();
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
int idReview_=0;
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();


  Future userLogin() async {
    String email = emailController.text;
    if(email.isNotEmpty){
      var timeNow = DateTime.now();
      var response = await http.post(
          Uri.parse('http://localhost:3000/api/reply'),// Nodejs
          body: json.encode({
            "idUser": id_,
            "idReview": idReview_,
            "createdAts": timeNow.toString(),
            "contents": email
          }),
          headers: {'Content-Type': 'application/json'});

      jsonDecode(response.body);

      // If the Response Message is Matched.

    }

  }
  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child:
              Container(
            alignment: Alignment.center,
            height: 55,

            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.fromLTRB(16 , 10 , 10 , 16),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFC9C9C9),
              ),
            ),
            child: TextFormField(

              controller: emailController,

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter ';
                }
                else {
                  return null;
                }
              },
              style: GoogleFonts.inter(
                fontSize: 16.0,
                color: const Color(0xFF15224F),
              ),
              maxLines: 1,
              cursorColor: const Color(0xFF15224F),
              decoration: InputDecoration(

                  labelText: 'Write anything....',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: const Color(0xFF969AA8),
                  ),
                  border: InputBorder.none),
            ),
          ),
          )
          ,
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xFF40BFFF),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                userLogin();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Home()
                  ),
                );
              }
            },
          ),
          const SizedBox(width: 5,)
        ],),
    );
  }
}
class ListReplyState extends State<ListReplyScreen> {
  List<String> nameProduct = [];
  List<String> picturesProduct = [];
  Future<List<Reply>> fetchAlbum() async {
    idReview_=widget.review.id!;
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/reply/getListReply/${widget.review.id}'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    List<Reply> review = (baseResponse.data as List?)
        ?.map((dynamic e) => Reply.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];

    http.Response response2;
    for (int i = 0; i < review.length; i++) {

      response2 = await http.get(
        Uri.parse('http://localhost:3000/api/user/${review[i].idUser}'),
        headers: {"Content-Type": "application/json; charset=utf-8"},
      );

      var signInRes = SignInRes.fromJson(jsonDecode(response2.body));
      var product = User.fromJson(signInRes.data!);

      nameProduct.add(product.name.toString());
      picturesProduct.add(product.avatarUser.toString());

    }
    //print(baseResponse.message);

    return review;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
        title: const Text(
          "Reply",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Container(
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
                          widget.avatar,
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
                            widget.nameUser,
                            style:const  TextStyle(
                                fontSize: 15,
                                color: Color(0xFF223263)
                            ),
                          ),
                          FivePointedStar(
                            defaultSelectedCount:widget.review.ratting as int ,
                            count: 5,
                            selectedColor:const Color(0xFFFFEB00) ,
                            size: const Size(15,15),
                          ),

                        ],
                      ),
                    ],
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
                    " ${widget.review.createdAts.toString().substring(0,10)}",
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
                " ${widget.review.contents.toString()}",
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
                    widget.review.pictureReview.toString(),
                    width: 60.0,
                    height: 60.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2),
                  ),
                  Image.network(
                    widget.review.pictureReview.toString(),
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
                      if (widget.review.idUser == id_){
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
                    likeCount: widget.review.likeCount!+1,
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

                ],),
              const Divider(
                color: Colors.grey,
              ),
              FutureBuilder<List<Reply>>(
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
                            return  Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),

                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          picturesProduct[index],
                                          width: 55.0,
                                          height: 55.0,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                      ),
                                      Text(
                                        nameProduct[index],
                                        style:const  TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF223263)
                                        ),
                                      ),
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
                                      fontSize: 13,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5),
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

                                          return SvgPicture.network(
                                            'https://www.svgrepo.com/show/512408/like-1386.svg',
                                            color: liked ? Colors.blue : Colors.grey,
                                            cacheColorFilter: true,
                                            height: 20,
                                            width: 20,
                                          );
                                        },
                                        likeCount: 0,

                                      ),
                                      Text(
                                        " ${snapshot.data![index].createdAts.toString().substring(0,10)}",
                                        style: const TextStyle(
                                          color: Color(0xFF9098B1),
                                          fontSize: 13,
                                        ),
                                      ),


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


            ],
          ),

        ),
      ),
      bottomNavigationBar:const MyCustomForm(),

    );
  }
}