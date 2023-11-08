import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/clock/Clock.dart';
class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.fromLTRB(16, 40, 16, 5),
            child: const Text(
              "Offer",
              style: TextStyle(
                color: Color(0xFF223263),
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 350,
            height: 90,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: const Color(0xFF40BFFF),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4C2E84).withOpacity(0.2),
                  offset: const Offset(0, 15.0),
                  blurRadius: 60.0,
                ),
              ],
            ),
              child:Text(
                'Use “MEGSL” Cupon For \n Get 90% off',
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),


          ),

          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 12),
          //   child:Image.asset(
          //     "assets/banner2.png",
          //     width: 400.0,
          //     height: 200.0,
          //   ),
          //
          //
          // ),
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
                  child: const Column(children: [
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
                child: const Column(children: [
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
      )

    );
  }
}