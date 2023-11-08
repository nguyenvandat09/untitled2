import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/main.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class ChangeMailScreen extends StatelessWidget {
  const ChangeMailScreen({super.key});

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
      body: const ChangeMailScreenState(),
    );
  }
}
class ChangeMailScreenState extends StatefulWidget {
  const ChangeMailScreenState({super.key});
  @override
  ChangeMailState createState() => ChangeMailState();

}

class ChangeMailState extends State<ChangeMailScreenState> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: email_);
  int code = 0;
  Future userUpdateName() async {
    // Getting value from Controller
    String emailc = emailController.text;
    // Starting Web API Call.
    if(emailc.isNotEmpty){
      var response = await http.put(
          Uri.parse('http://localhost:3000/api/user/$id_'),
          body: json.encode({
            'avatarUser':avatarUser_,
            'username' : username_,
            'password' : pass_,
            'name': name_,
            'email': emailc.toString(),
            'phone': phone_,
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
    return Form(
        key: _formKey,
        child:
        Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),

          Container(
            key: _formKey,
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Can\'t be empty';
                }
                if (text.length < 4) {
                  return 'Too short';
                }
                return null;
              },
              style: GoogleFonts.inter(
                fontSize: 16.0,
                color: const Color(0xFF15224F),
              ),
              maxLines: 1,
              cursorColor: const Color(0xFF15224F),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail_outline_outlined),
                  labelText: 'Email',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: const Color(0xFF969AA8),
                  ),
                  border: InputBorder.none),
            ),
          ),//
          // email
          const Text("We Will Send verification to your New Email",
            style: TextStyle(
              color:  Color(0xFF40BFFF),
              fontSize: 15,
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
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Home()),
                // );
              },
              child:Text(
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
          ),//button add
        ],
      ),
    );
  }
}

