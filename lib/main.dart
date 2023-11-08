import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/provider/cart_provider.dart';

import 'models/user.dart';
import 'models/signRes.dart';

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:untitled2/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/bottomNavigation/bottom_navigation_bar.dart';
import 'package:untitled2/screen/register_screen.dart';

//flutter run -d chrome --web-browser-flag "--disable-web-security"
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash",
      home: SplashScreenPage(),
    ),
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});


  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return const HomePage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Image.asset(
          "assets/Vector.png",
          width: 100.0,
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
late int id_;
late String name_;
late String username_;
late String email_;
late String phone_;
late String pass_;
late String address_;
late String gender_;
late String avatarUser_;
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  int code = 0;

  Future userLogin() async {
    // Getting value from Controller

    String email = emailController.text;
    String password = passwordController.text;
    // Starting Web API Call.
    if(email.isNotEmpty&&password.isNotEmpty){
      var response = await http.post(
          //Uri.parse('http://localhost:8080/api/user/login'),//java
          Uri.parse('http://localhost:3000/api/user/login'),// Nodejs
          body: json.encode({'username': email, 'password': password}),
          headers: {'Content-Type': 'application/json'});
      // print('Message: ${jsonDecode(response.body)["message"]}');
      // print('Code: ${jsonDecode(response.body)["code"]}');
      // Getting Server response into variable.
      //var message = jsonDecode(response.body);
      //print(message);

      var signInRes = SignInRes.fromJson(jsonDecode(response.body));
      // If the Response Message is Matched.
      if (signInRes.code == 0) {}
      var user = User.fromJson(signInRes.data!);
      id_= user.id;
      name_ = user.name;
      username_ = user.username;
      pass_ = user.password;
      phone_ = user.phone;
      email_ = user.email;
      address_ = user.address;
      gender_ = user.gender;
      avatarUser_ = user.avatarUser;

      if (jsonDecode(response.body)["code"] as int == 0) {

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username_.toString());
        prefs.setString('pass', pass_.toString());
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => const Home()));
      } else {
        code = 1;
      }

    }

  }

  Future getDataLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailData = prefs.getString('username');
    String? passData = prefs.getString('pass');
    if(emailData == null || passData == null ){
      emailController.text = '';
      passwordController.text = '';
    }else {
      emailController.text = emailData.toString();
      passwordController.text = passData.toString();
    }
  }
  @override
  Widget build(BuildContext context) {

    getDataLogin();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //const MyApp(),
          Container(
            alignment: Alignment.center,
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(

              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
                }
                else {
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
                  labelText: 'Username',
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
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }
                else {
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
          GestureDetector(
            onTap: () {
               //Navigator.push(context, MaterialPageRoute(builder: (context) => const successScreen()),);

              if (_formKey.currentState!.validate()) {
                userLogin();
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 65,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
    return WillPopScope(
      onWillPop: () async => false,
      child:
        Scaffold(
      body: SingleChildScrollView(
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
               Text(
                "Welcome to Lafyuu",
                   style: GoogleFonts.lato(
                     textStyle: const TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),
                   ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
              ),
              const Text(
                "Sign in to continue",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                children: [
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
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
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
    ),
    );
  }
}
