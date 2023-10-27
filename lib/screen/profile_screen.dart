import 'package:flutter/material.dart';
import 'package:untitled2/screen/address_screem.dart';
import 'package:untitled2/screen/change_password_screeen.dart';
import 'package:untitled2/screen/gender_screen.dart';
import 'package:untitled2/screen/change_phone_screen.dart';
import 'package:untitled2/screen/change_mail_screen.dart';
import 'package:untitled2/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xFFFFFFFF),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.navigate_before,
            color: Color(0xFF223263),
            size: 30,
          ),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
            ),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: ClipOval(
                      child: Image.network(
                        avatarUser_,
                        width: 85.0,
                        height: 85.0,
                      ),
                    ),
                ),
                Column(
                  children: [

                    Text(
                      " $name_",
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      username_,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFEFEFEF),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.person_outline,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Name ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF223263),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          name_,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GenderScreen()),
                            );
                          },
                        ),
                      ),
                    ],
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.mail_outline_outlined,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Mail ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF223263),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        email_,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF9098B1),
                          fontSize: 13,
                        ),
                      ),
                      Container(
                        margin:const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child:    IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangeMailScreen()),
                            );
                          },
                        ),
                      ),
                   
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFEFEFEF),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Number Phone ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF223263),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          phone_,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(2, 0, 8, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePhoneScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  width: 1.0,
                  color: const Color(0xFFEFEFEF),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lock_outline,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Change Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF223263),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "..............",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9098B1),
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangePasswordScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 120,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      ),
                      const Text(
                        "Address ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF223263),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: 80,
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text(
                          address_,
                          style: const TextStyle(
                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 7.7, 0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.navigate_next,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddressScreen()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
