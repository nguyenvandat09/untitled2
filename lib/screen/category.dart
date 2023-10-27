import 'package:flutter/material.dart';
import 'package:untitled2/models/category.dart';
import 'package:untitled2/models/section_title.dart';
import 'package:untitled2/screen/componets/details_category_screen.dart';
import '../../../constants.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../models/base_response.dart';
class Categories extends StatelessWidget {
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
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Category",
            pressSeeAll: () {

            },
          ),
        ),
        Center(
             child: FutureBuilder<List<Category>>(
               future: fetchAlbum(),
               builder: (context, snapshot) {
                 if (snapshot.hasData) {
                   return SizedBox(
                     height: 100,
                     child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
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
                                     width: 1.2,
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
                         // return ListTile(
                         //   leading: CircleAvatar(
                         //     child: Image.network(
                         //         snapshot.data![index].avatar.toString()),
                         //   ),
                         //   title: Text(snapshot.data![index].name.toString()),
                         //   trailing:
                         //   Text(snapshot.data![index].amount.toString()),
                         //   subtitle: Text(snapshot.data![index].date.toString()),
                         // );
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

      ],
    );

  }
}
