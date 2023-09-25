import 'package:untitled2/screen/megasale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category.dart';

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide.none,
);
class ExporeScreen extends StatelessWidget {
  const ExporeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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

                  Image.asset(
                    "assets/Traitim.png",
                    width: 50,
                    height: 70,
                  ),
                  Image.asset(
                    "assets/Nocation.png",
                    width: 50,
                    height: 70,
                  ),
                ],

              ),
              //margin: const EdgeInsets.fromLTRB(0, 5, 0, 13),

              Container(
                margin: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                child: const Categories(),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                child: const Categories(),
              ),
            ],
          ),
        ),
      ),


    );
  }
}