import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/models/base_response.dart';
import 'package:untitled2/models/reviews.dart';
import 'package:untitled2/provider/cart_provider.dart';
import 'package:untitled2/screen/componets/color_dot.dart';
import 'package:untitled2/screen/cart_screen.dart';
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:untitled2/screen/list/list_review_screen.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product, required this.statusFavorite});
  final Product product;
  final bool statusFavorite;
  @override
  State<DetailsScreen> createState() => _ProductGridItemState();
}
int idProduct_=0;
class _ProductGridItemState extends State<DetailsScreen> {

  int reviewCount=0;
  double rattingAverage=0;
  Future fetchAlbum() async {

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/reviews/getListReviewsByProduct/${widget.product.id}'),
      headers: {"Content-Type": "application/json; charset=utf-8"},
    );
    var baseResponse = BaseResponse.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

    List<Review> review = (baseResponse.data as List?)
        ?.map((dynamic e) => Review.fromJson(e as Map<String, dynamic>))
        .toList() ?? [];

    if(review.isNotEmpty) {
      reviewCount = review.length;

      for (int i = 0; i < review.length; i++) {
        rattingAverage += review[i].ratting!;
      }
      rattingAverage /= review.length;

      var response2 = await http.put(
          Uri.parse('http://localhost:3000/api/product/${widget.product.id}'),
          body: json.encode({
            "idCategory": widget.product.idCategory,
            "name": widget.product.name,
            "price": widget.product.price,
            "priceOld": widget.product.priceOld,
            "urlPicture": widget.product.urlPicture,
            "ratting": rattingAverage.toInt(),
            "isActive": widget.product.isActive
          }),
          headers: {
            'Content-Type': 'application/json'
          }
      );
      jsonDecode(response2.body);
    }

  }
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    if (!isLiked) {

          var responseOrderItem = await http.post(
              Uri.parse(
                  'http://localhost:3000/api/favorite'),
              body: json.encode({
                'idProduct': widget.product.id,
                'idUser': id_,
              }),
              headers: {
                'Content-Type':
                    'application/json'
              });
         jsonDecode(responseOrderItem.body);
    }else{

    }
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    bool statusF = widget.statusFavorite;
    fetchAlbum();
    return Scaffold(
      // backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),

      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.product.urlPicture.toString(),
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
            // const SizedBox(height: defaultPadding * 1.5),

              Container(

                padding: const EdgeInsets.fromLTRB(defaultPadding,
                    defaultPadding * 2, defaultPadding, defaultPadding),
                decoration: const BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius * 3),
                    topRight: Radius.circular(defaultBorderRadius * 3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name.toString(),

                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        LikeButton(
                          size: 25,
                          circleColor:
                          const CircleColor(start: Color(0xffff0000), end: Color(
                              0xffff3434)),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Color(0xffe70000),
                            dotSecondaryColor: Color(0xffe70000),
                          ),
                          likeBuilder: ( liked ) {
                            if(statusF == false){
                              statusF = liked;
                              if(statusF == true){
                                statusF = true;
                              }
                            }
                            // if(isLiked){
                            // }
                            return Icon(
                              Icons.favorite_outlined,
                              color:statusF  ? Colors.red : Colors.grey,
                              size: 25,
                            );
                          },
                          onTap: onLikeButtonTapped,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                    ),
                    FivePointedStar(
                      defaultSelectedCount: widget.product.ratting as int,
                      count: 5,
                      selectedColor:const Color(0xFFFFEB00),
                      size: const Size(20,20),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "\$${widget.product.price}",
                        style: GoogleFonts.inter(
                          fontSize: 23.0,
                          color: const Color(0xFF40BFFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Text(
                      "Select Size",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Row(
                      children:  [
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Text("6",
                              style: TextStyle(
                                color:  Color(0xFF0D2120),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Text("6.5",
                              style: TextStyle(
                                color:  Color(0xFF0D2120),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Text("7",
                              style: TextStyle(
                                color:  Color(0xFF0D2120),
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Text("7.5",
                              style: TextStyle(
                                color:  Color(0xFF0D2120),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(defaultPadding / 4),
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            child: Text("8",
                              style: TextStyle(
                                color:  Color(0xFF0D2120),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),


                      ],
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    Text(
                      "Select Colors",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Row(
                      children: [
                        ColorDot(
                          color: Color(0xFFBEE8EA),
                          isActive: true,
                        ),
                        ColorDot(
                          color: Color(0xFF40BFFF),
                          isActive: false,
                        ),
                        ColorDot(
                          color: Color(0xFF141B4A),
                          isActive: false,
                        ),
                        ColorDot(
                          color: Color(0xFF23FF00),
                          isActive: false,
                        ),

                        ColorDot(
                          color: Color(0xFFFFE800),
                          isActive: false,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                    ),
                    Text(
                      "Specification",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shown:" ,
                              style: GoogleFonts.inter(
                                fontSize: 15.0,
                                color: const Color(0xFF223263),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 55),
                            ),
                            Text(
                              "Laser Blue/Anthracite" ,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.inter(
                                fontSize: 13.0,
                                color: const Color(0xFF9098B1),
                              ),
                            ),

                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Style:" ,
                              style: GoogleFonts.inter(
                                fontSize: 15.0,
                                color: const Color(0xFF223263),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 105),
                            ),
                            Text(
                              "CD0113-400" ,
                              style: GoogleFonts.inter(
                                fontSize: 13.0,
                                color: const Color(0xFF9098B1),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 7),
                        ),
                        Text(
                          "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience." ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Review Product",
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        TextButton(
                          onPressed: (){
                            idProduct_ = widget.product.id!;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListReviewScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "See More",
                            style: TextStyle(color:  Color(0xFF40BFFF)),
                          ),
                        )
                      ],
                    ),

                    Row(
                      children: [
                        FivePointedStar(
                          defaultSelectedCount: widget.product.ratting as int,
                          count: 5,
                          selectedColor:const Color(0xFFFFEB00),
                          size: const Size(15,15),

                        ),

                        // Text(
                        //   " ${widget.product.ratting} " ,
                        //   style: GoogleFonts.inter(
                        //     fontSize: 10.0,
                        //     color: const Color(0xFF9098B1),
                        //   ),
                        // ),
                        // Text(
                        //   "($reviewCount Review)" ,
                        //   style: GoogleFonts.inter(
                        //     fontSize: 10.0,
                        //     color: const Color(0xFF9098B1),
                        //   ),
                        // ),
                      ],
                    ),

                    const SizedBox(height: defaultPadding ),


                    Container(
                      margin:const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {

                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(widget.product, 1, "");

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen( product:widget.product,),
                              ),
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            //shape: const StadiumBorder()
                          ),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

          ],
        ),
    ),

    );
  }
}