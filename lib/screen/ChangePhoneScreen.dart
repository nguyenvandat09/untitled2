import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
const List<String> list = <String>['Male', 'Female', 'Other', ];

class ChangePhoneScreen extends StatefulWidget {
  const ChangePhoneScreen({super.key});


  @override
  _AddressScreenState createState() => _AddressScreenState();

}

class _AddressScreenState extends State<ChangePhoneScreen> {
  ImagePicker picker = ImagePicker();
  XFile? image;


  @override
  Widget build(BuildContext context) {

    final email = GlobalKey<FormState>();
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
        title: const Text("Phone Number",
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
            key: email,
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
                  prefixIcon: const Icon(Icons.phone_android_outlined),
                  labelText: 'Phone number',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12.0,
                    color: const Color(0xFF969AA8),
                  ),
                  border: InputBorder.none),
            ),
          ),// email

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
                if (email.currentState!.validate()) {
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
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
