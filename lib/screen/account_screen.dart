import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/screen/list/listOrders_screen.dart';
import 'package:untitled2/screen/profile_screen.dart';
class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color(0xFFECEBEB),
        title: const Text("Account",
          style: TextStyle(
            color:  Color(0xFF223263),
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),

          child:Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child:Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: IconButton(

                          icon: const Icon(Icons.person_outline,color:  Color(0xFF40BFFF),size: 28,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProfileScreen()),
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                        ),
                      ),

                    ],
                  ),
                ),
                GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ListOrders()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,color:  Color(0xFF40BFFF),size: 26,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListOrders()),
                    );
                  },
                ),
              ),
              const Text(
                "Order",
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18,
                ),
              ),

            ],
          ),
        ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: IconButton(

                          icon: const Icon(Icons.logout_outlined,color:  Color(0xFF40BFFF),size: 27,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          },
                        ),
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 18,
                        ),
                      ),

                    ],
                  ),),
              ],
            ),
          )

      ),
    );
  }
}
