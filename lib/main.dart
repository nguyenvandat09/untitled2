import 'package:flutter/material.dart';
import 'package:untitled2/constants.dart';
import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/home_screens.dart';
import 'package:untitled2/screen/register_screen.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash",
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }


  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Map userData = {};
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          "assets/Vector.png",
          width: 200.0,
          height: 100.0,
        ),
      ),
    );
  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }else if(value.toString()!='admin@gmail.com'){
                  return 'Oops! Your Email Is Not Correct ';
                }else{
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
                  prefixIcon: const Icon(Icons.account_circle_outlined),
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }else if(value.toString()!='123456'){
                  return 'Oops! Your Password Is Not Correct ';
                }else{
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
              height: 65,
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
                  if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),
                      );
                   }
                 },
                child:Text(
                  'Sign in',
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

        ],
      ),
    );
  }
}
// Home Page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            margin: const EdgeInsets.symmetric(vertical: 60),
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

            "Welcome to Lafyuu",
            style: TextStyle(fontSize: 25),
          ),
          const Text(
            "Sign in to continue",
            style: TextStyle(
              color: Colors.grey,
                fontSize: 15,

            ),

          ),

            const MyCustomForm(),

          const Text(
            "OR",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),

          ),
          Container(
            alignment: Alignment.center,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 14),

            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
           child: Row(
             children: [
               Image.asset(
                 "assets/Facebook.png",
                 width: 26.0,
                 height: 26.0,
               ),
               Container(
                 alignment: Alignment.centerRight,
                 margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                   "Login with Facebook ",
                    textAlign: TextAlign.center,
                   style: TextStyle(

                     color: Color(0xFF9098B1),
                     fontSize: 13,
                   ),

                 ),
               ),
             ],
           ),

            ),
          Container(
            alignment: Alignment.center,
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/Google.png",
                  width: 26.0,
                  height: 26.0,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Text(
                    "Login with Google ",
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      color: Color(0xFF9098B1),
                      fontSize: 13,
                    ),

                  ),
                ),
              ],

            ),

          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(

              "For got Password?",
              style: TextStyle(
                color: Color(0xFF40BFFF),
                fontSize: 12,
              ),

            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
               const Text(
                "Don’t have an account ?",
                style: TextStyle(
                  color: Color(0xFF0E0E0E),
                  fontSize: 12,
                ),

              ),
             GestureDetector(
              onTap: () {
                Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const RegisterScreen()),
                );
              },
              child: const Text(
                "Register",
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