import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/home_screens.dart';
import 'package:untitled2/main.dart';
// Home Page
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
              ),
              Image.asset(
                "assets/Vector2.png",
                width: 100.0,
                height: 100.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
              const Text(

                "Let’s Get Started",
                style: TextStyle(fontSize: 25),
              ),
              const Text(
                "Create an new account",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,

                ),

              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 10),
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
                    color: const Color(0xFF15224F),
                  ),
                  maxLines: 1,
                  cursorColor: const Color(0xFF15224F),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      labelText: 'Your Name',
                      labelStyle: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: const Color(0xFF969AA8),
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 10),
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
                    color: const Color(0xFF15224F),
                  ),
                  maxLines: 1,
                  cursorColor: const Color(0xFF15224F),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline_outlined),
                      labelText: 'Your email',
                      labelStyle: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: const Color(0xFF969AA8),
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                margin: const EdgeInsets.symmetric( horizontal: 16,vertical: 10),

                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFEFEFEF),
                  ),
                ),
                child: TextField(
                  obscureText: true,

                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: const Color(0xFF40BFFF),
                  ),
                  maxLines: 1,
                  cursorColor: const Color(0xFF40BFFF),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: 'Password',
                      labelStyle: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: const Color(0xFF969AA8),
                      ),
                      border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                margin: const EdgeInsets.symmetric( horizontal: 16,vertical: 10),

                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFEFEFEF),
                  ),
                ),
                child: TextField(
                  obscureText: true,

                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: const Color(0xFF40BFFF),
                  ),
                  maxLines: 1,
                  cursorColor: const Color(0xFF40BFFF),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: 'Re-Password',
                      labelStyle: GoogleFonts.inter(
                        fontSize: 12.0,
                        color: const Color(0xFF969AA8),
                      ),
                      border: InputBorder.none),
                ),
              ),

              Container(
                alignment: Alignment.center,
                height: 65,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
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
                child: TextButton(
                  style: ButtonStyle(

                    backgroundColor: MaterialStateProperty.all(const Color(0xFF40BFFF)),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  },
                  child:Text(
                    'Sign Up',
                    style: GoogleFonts.inter(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    "Have an account ?",
                    style: TextStyle(
                      color: Color(0xFF0E0E0E),
                      fontSize: 12,
                    ),

                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: Color(0xFF40BFFF),
                        fontSize: 12,
                      ),
                    ),
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