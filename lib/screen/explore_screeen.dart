import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/models/base_response.dart';
import 'package:untitled2/models/category.dart';
import 'package:untitled2/screen/componets/details_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/componets/search_product.dart';
import 'package:untitled2/screen/notification_screen.dart';
const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
class ExporeScreen extends StatelessWidget {
  const ExporeScreen({super.key});

  Future<List<Category>> fetchAlbum() async {
    final response = await http.get(
      //Uri.parse('http://localhost:8080/api/category'),
      Uri.parse('http://localhost:3000/api/category'),
      headers: {"Content-Type": "application/json; charset=utf-8"},);

    if (response.statusCode == 200) {
      //var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));
      var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return (baseResponse.data as List?)?.map((dynamic e) => Category.fromJson(e as Map<String,dynamic>)).toList() ??[];
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {

    return  SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(16, 19, 14, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFEFEFEF),
                        ),
                      ),
                      child: TextField(
                        onTap: (){
                          showSearch(context: context, delegate: CustomSearchDelegate());
                        },
                        style: GoogleFonts.inter(
                          fontSize: 16.0,
                          color: const Color(0xFF40BFFF),
                        ),
                        cursorColor: const Color(0xFF40BFFF),
                        decoration: InputDecoration(

                            prefixIcon: Image.asset(
                              "assets/Search.png",
                              width: 26.0,
                              height: 26.0,
                            ),
                            hintText: 'Search Product',
                            labelStyle: GoogleFonts.inter(
                              fontSize: 12.0,
                              color: const Color(0xFF969AA8),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),

                  Stack(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          icon:Image.asset("assets/Nocation.png") ,
                          iconSize: 45,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const NotificationScreen()),
                            );
                          },
                        ),
                      ),

                      Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.fromLTRB(32, 14, 0, 0),
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFFFB7181),
                            radius: 5.5,
                          )
                      )


                    ],
                  ),
                ],

              ),
              //margin: const EdgeInsets.fromLTRB(0, 5, 0, 13),
              Container(
               margin: const EdgeInsets.symmetric(vertical:20 ),),
              const Text(
                'Man Fashion',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(17, 15, 17, 0),
                child: Center(
                      child: FutureBuilder<List<Category>>(
                        future: fetchAlbum(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 270,
                              child: GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 0.9,
                                    mainAxisSpacing: 10
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => detailsCategoryScreen(category: snapshot.data![index],),
                                        ),
                                      );
                                    },
                                    child:Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(7, 0, 7, 7),

                                          alignment: Alignment.center,
                                          height: 70,
                                          width: 70,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100.0),
                                            border: Border.all(
                                              width: 1.0,
                                              color: const Color(0xFFEFEFEF),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            child:
                                            Image.network(
                                              snapshot.data![index].iconurl.toString(),
                                              width: 60,
                                              height: 60,),
                                            //const SizedBox(height: defaultPadding / 2),


                                          ),
                                        ),
                                        Text(
                                          snapshot.data![index].name.toString(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFF969AA8),
                                          ),
                                        )
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
                    ),
              ),
              const Text(
                'Woman Fashion',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF000000),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(17, 15, 17, 10),
                child: Center(
                  child: FutureBuilder<List<Category>>(
                    future: fetchAlbum(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 300,
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.9,
                                //crossAxisSpacing: 20,
                                mainAxisSpacing: 10
                            ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => detailsCategoryScreen(category: snapshot.data![index],),
                                    ),
                                  );
                                },
                                child:Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(7, 0, 7, 7),

                                      alignment: Alignment.center,
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100.0),
                                        border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xFFEFEFEF),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        child:
                                        Image.network(
                                          snapshot.data![index].iconurl.toString(),
                                          width: 60,
                                          height: 60,),
                                        //const SizedBox(height: defaultPadding / 2),


                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF969AA8),
                                      ),
                                    )
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
                ),
              ),
            ],
          ),
        ),



    );
  }
}