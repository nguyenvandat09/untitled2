
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled2/main.dart';

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const List<String> list = <String>['Male', 'Female', 'Other', ];

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});
  @override
  _UpdateUserScreenState createState() => _UpdateUserScreenState();

}
class UpdateName extends StatefulWidget {
  const UpdateName({super.key});

  @override
  State<UpdateName> createState() => MyCustomFormUpadateState();
}
String genderNew='Male';
class MyCustomFormUpadateState extends State<UpdateName> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: name_);
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
            'name': emailc.toString(),
            'email': email_,
            'phone': phone_,
            'gender': genderNew,
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
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: 'Full Name',
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

class _UpdateUserScreenState extends State<GenderScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
        title: const Text("Information",
          style: TextStyle(
            color:  Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body:  Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                image == null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundColor: const Color(0xFFFFFFFF),
                        child: ClipOval(
                          child: Image.network(
                            avatarUser_,
                            width: 85.0,
                            height: 85.0,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(File(image!.path)),
                        radius: 50,
                        backgroundColor: const Color(0xFFFFFFFF),
                        //child: Image.file(File(image!.path) ,height: 100,width: 100,)
                      ),
                ElevatedButton(
                    onPressed: () async {
                      image = await picker.pickImage(source: ImageSource.gallery);
                      setState(() {

                      });
                    },
                    child:const Text("Pick Avatar")
                ),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
          ), // email
          // address
          const DropdownMenuExample(),

          const UpdateName(),//button add
        ],
      ),
    );
  }
}
class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(

      initialSelection: list.first,
      onSelected: (String? value) {
        genderNew= value!;

        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
