import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled2/main.dart';
class ChangePhoneScreen extends StatelessWidget {
  const ChangePhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xFFFFFFFF),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:const Icon(Icons.navigate_before,
            color:  Color(0xFF223263),
            size: 30,
          ),
        ),
        title: const Text("Email",
          style: TextStyle(
            color:  Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: const ChangePhoneScreenState(),
    );
  }
}

class ChangePhoneScreenState extends StatefulWidget {
  const ChangePhoneScreenState({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ChangePhoneState createState() {
    return _ChangePhoneState();
  }
}

class _ChangePhoneState extends State<ChangePhoneScreenState> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: phone_);
  int code = 0;
  Future userUpdateName() async {
    // Getting value from Controller
    String emailc = emailController.text;
    String fullname= emailc.toString() ;
    // Starting Web API Call.
    if(emailc.isNotEmpty){
      var response = await http.put(
          Uri.parse('http://localhost:3000/api/user/$id_'),
          body: json.encode({
            'avatarUser_':avatarUser_,
            'username' : username_,
            'password' : pass_,
            'name': name_,
            'email': email_,
            'phone': fullname.toString(),
            'gender': gender_,
            'address': address_,
          }),

          headers: {'Content-Type': 'application/json'});
      // print('Message: ${jsonDecode(response.body)["message"]}');
      // print('Code: ${jsonDecode(response.body)["code"]}');
      // Getting Server response into variable.
      var message = jsonDecode(response.body);
      print(message);
    }

  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
                  return 'Please enter ';
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
                  prefixIcon: const Icon(Icons.phone_android_rounded),
                  labelText: 'Number Phone',
                  hintText: name_,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: const Color(0xFF969AA8),
                  ),
                  border: InputBorder.none),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);

              if (_formKey.currentState!.validate()) {
                userUpdateName();
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
                'Save',
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



