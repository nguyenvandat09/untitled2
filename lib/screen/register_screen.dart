import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/screen/bottom_navigation_bar.dart';
import 'package:untitled2/main.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

// Home Page
String rePass="";
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
              const FormRegister(),

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
class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
final registername = TextEditingController();
final registeremail = TextEditingController();
final registerusername = TextEditingController();
final registerphone = TextEditingController();
final registerpassword = TextEditingController();
final reRegisterPassword = TextEditingController();
final registeraddress= TextEditingController();

class MyCustomFormState extends State<FormRegister> {
  final _formKey = GlobalKey<FormState>();
  Future userRegister() async{
    // Getting value from Controller
    String name = registername.text;
    String username = registerusername.text;
    String password = registerpassword.text;
    String email = registeremail.text;
    String phone = registerphone.text;
    String address = registeraddress.text;
    //print(data);
    // Starting Web API Call.
    var response = await http.post(
        Uri.parse('http://localhost:8080/api/user'),
        body: json.encode({
          "avatarUser": "https://cdn-icons-png.flaticon.com/512/5556/5556468.png",
          'username' : username,
          'password' : password,
          'name': name,
          'email': email,
          'phone': phone,
          "gender": "Male",
          "address": address,
          "isActive": true
        }),
        headers: {
          'Content-Type': 'application/json'
        }
    );
     jsonDecode(response.body);
  }
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
              controller: registername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Name';
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
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              controller: registerusername,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Username';
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
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              controller: registerpassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }else{
                  rePass=value.toString();
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
              controller: reRegisterPassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Password';
                }else if(value.toString()!=rePass.toString()){
                  return 'Please enter the correct password';
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
              controller: registeremail,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Email';
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
              controller: registerphone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number phone';
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
                  prefixIcon: const Icon(Icons.phone_iphone_outlined),
                  labelText: 'Your Phone Number',
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
            margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              controller: registeraddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Address';
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
                  prefixIcon: const Icon(Icons.home_outlined),
                  labelText: 'Address',
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
                  userRegister();

                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),
                  );
                }
              },
              child:Text(
                'Sign up',
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
