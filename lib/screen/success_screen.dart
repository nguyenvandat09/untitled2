import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/bottomNavigation/bottom_navigation_bar.dart';

class successScreen extends StatelessWidget {
  const successScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
    body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF40BFFF).withOpacity(0.2),
                      offset: const Offset(0, 15.0),
                      blurRadius: 60.0,
                    ),
                  ],
                ),
                padding:  const EdgeInsets.all(10),
                child:  CircleAvatar(
                  radius: 43,
                  backgroundColor: const Color(0xFF40BFFF),
                  child: Image.asset(
                      "assets/success.png",
                  ),
                ),
              ),

              Text(
                'Success',
                style: GoogleFonts.inter(
                  fontSize: 23.0,
                  color:  const Color(0xFF223263),
                  fontWeight: FontWeight.w600,

                ),
                textAlign: TextAlign.center,
              ),
              Container(
                  margin: const EdgeInsets.all(5)),
              Text(
                'thank you for shopping using lafyuu',
                style: GoogleFonts.inter(
                  fontSize: 13.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w300,

                ),
                textAlign: TextAlign.center,
              ),
              Container(
                  margin: const EdgeInsets.all(5)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home()),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 10),
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
                  child: Text(
                    'Back to Home',
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,

                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
      )
    );
  }
}