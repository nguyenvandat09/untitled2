import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled2/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/screen/componets/color_dot.dart';
import 'package:untitled2/screen/cart_screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                color: const Color(0xFF40BFFF),
                icon: const Icon(Icons.search_outlined,size: 25,),
              ),
              IconButton(
                onPressed: () {},
                color: const Color(0xFF40BFFF),
                icon: const Icon(Icons.settings,size: 25,),
              )
            ],
          ),

        ],
      ),
      body:  SingleChildScrollView(
        physics:const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          children: [
            Image.asset(
              product.image,
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
                            product.title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Image.asset(
                          "assets/Traitim.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),

                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        "\$" + product.price.toString(),
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
                    Row(
                      children: const [
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
                              "Laser \nBlue/Anthracite/Watermelon\n/White" ,
                              style: GoogleFonts.inter(
                                fontSize: 13.0,
                                color: const Color(0xFF9098B1),
                              ),
                            ),

                          ],
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
                          "The Nike Air Max 270 React ENG combines\n a full-length React foam midsole with a 270 Max Air \nunit for unrivaled comfort and a striking\n visual experience." ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Text(
                      "Review Product",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Image.asset(
                          "assets/star.png",
                          width: 25.0,
                          height: 25.0,
                        ),

                        Image.asset(
                          "assets/star05.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        Text(
                          "4.5" ,
                          style: GoogleFonts.inter(
                            fontSize: 10.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                        Text(
                          "(5 Review)" ,
                          style: GoogleFonts.inter(
                            fontSize: 10.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: defaultPadding * 2),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
                          child:Image.asset(
                            "assets/profile.png",
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        Column(
                          children:  [
                            const Text(
                              "James Lawson",
                              style: TextStyle(fontSize: 15),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/star.png",
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  "assets/star.png",
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  "assets/star.png",
                                  width: 25.0,
                                  height: 25.0,
                                ),
                                Image.asset(
                                  "assets/star.png",
                                  width: 25.0,
                                  height: 25.0,
                                ),

                                Image.asset(
                                  "assets/star.png",
                                  width: 25.0,
                                  height: 25.0,
                                ),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    Text(
                      "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites." ,
                      style: GoogleFonts.inter(
                        fontSize: 13.0,
                        color: const Color(0xFF9098B1),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/product03.png",
                          width: 50.0,
                          height: 50.0,
                        ),
                        Image.asset(
                          "assets/product.png",
                          width: 50.0,
                          height: 50.0,
                        ),

                        Image.asset(
                          "assets/product03.png",
                          width: 50.0,
                          height: 50.0,
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 53,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CartScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            //shape: const StadiumBorder()
                          ),
                          child: const Text("Add to Cart"),
                        ),
                      ),
                    )
                  ],
                ),
              ),

          ],
        ),
    ),

    );
  }
}
