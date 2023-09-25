import 'package:untitled2/screen/megasale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/flashsale.dart';
import 'category.dart';
import 'package:untitled2/screen/clock/Clock.dart';
import 'package:untitled2/screen/Notification_screen.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
class HomeMain extends StatelessWidget {
  const HomeMain({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 35, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      margin: const EdgeInsets.fromLTRB(16, 15, 14, 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFEFEFEF),
                        ),
                      ),
                      child: TextField(
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

                  IconButton(
                   icon:Image.asset("assets/Traitim.png") ,
                    iconSize: 50,
                    onPressed: () {
                    },
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
              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding:const EdgeInsets.all( 12),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/banner.png',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
                    child: Column(children:  const [
                      Text(
                        'Super Flash Sale\n50% OFF',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      ),
                      HomePage(),
                    ],),
                  ),
                ],
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                child: const Categories(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(17, 0, 17, 10),
                child:  const PopularProducts(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(17, 0, 17, 10),
                child:  const MegaProducts(),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    padding:const EdgeInsets.all( 12),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/banner2.png',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(vertical: 50,horizontal: 50),
                    child: Column(children: const [
                      Text(
                        '90% Off Super Mega Sale',
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0),
                      ),
                      Text(
                        'Special birthday Lafyuu',
                        style: TextStyle(color: Colors.white,

                            fontWeight: FontWeight.bold,
                            fontSize: 13.0),
                      ),
                    ],),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),


    );
  }
}