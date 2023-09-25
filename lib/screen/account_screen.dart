import 'package:flutter/material.dart';
import 'package:untitled2/screen/address_screem.dart';
import 'package:untitled2/screen/changePassword_screeen.dart';
import 'package:untitled2/screen/Gender_screen.dart';
import 'package:untitled2/screen/ChangePhoneScreen.dart';
import 'package:untitled2/screen/changeMail_screen.dart';
class AcccountScreen extends StatelessWidget{
  const AcccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16, 40, 16, 5),
                child: const Text(
                  "Account",
                  style: TextStyle(
                    color: Color(0xFF223263),
                    fontSize: 25,
                  ),

                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16 ,vertical: 16),
                    child:Image.asset(
                      "assets/profile.png",
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Username",
                        style: TextStyle(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const
                      Icon(Icons.transgender_outlined,
                        size: 26.0,
                        weight: 26.0,
                        color: Color(0xFF40BFFF),
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Gender ",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Color(0xFF223263),
                            fontSize: 13,
                          ),

                        ),
                      ),
                    ],),
                   Row(children: [
                     Container(
                       margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                       child: const Text(
                         "Male",
                         textAlign: TextAlign.center,
                         style: TextStyle(

                           color: Color(0xFF9098B1),
                           fontSize: 13,
                         ),

                       ),
                     ),
                     Container(
                       margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                       child:  IconButton(
                         icon: const Icon(Icons.navigate_next,),
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const GenderScreen()),
                           );
                         },
                       ),
                     ),
                   ],),

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
                    Row(children: [
                      const
                      Icon(Icons.mail_outline_outlined,
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
                    ],),

                    Row(children: [

                     const Text(
                          "Derlaxy@yahoo.com ",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),

                        ),

                      Container(

                        child: IconButton(
                          icon: const Icon(Icons.navigate_next,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ChangeMailScreen()),
                            );
                          },
                        ),
                      ),
                    ],),

                  ],

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Row(
                          children: [
                            const
                            Icon(Icons.phone_android,
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
                        child: const Text(
                          "0123767342",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                        child:  IconButton(
                          icon: const Icon(Icons.navigate_next,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ChangePhoneScreen()),
                            );
                          },
                        ),
                      ),
                    ],),

                  ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row( children:  [

                      const Icon(Icons.location_on,
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
                    ],),
                    Row(children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: const Text(
                          "",
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Color(0xFF9098B1),
                            fontSize: 13,
                          ),

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 7.7, 0),
                        child: IconButton(
                          icon: const Icon(Icons.navigate_next,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AddressScreen()),
                            );
                          },
                        ),
                      ),
                    ],),


                  ],
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const
                      Icon(Icons.lock_outline,
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
                    ],),
                   Row(children: [
                     Container(
                       child: const Text(
                         "..............",
                         textAlign: TextAlign.center,
                         style: TextStyle(

                           color: Color(0xFF9098B1),
                           fontSize: 20,
                         ),

                       ),
                     ),
                     Container(
                       margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                       child:  IconButton(
                         icon: const Icon(Icons.navigate_next,),
                         onPressed: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                           );
                         },
                       ),
                     ),
                   ],)

                  ],
                ),

              ),
            ],
          ),

      ),
    );
  }
}
