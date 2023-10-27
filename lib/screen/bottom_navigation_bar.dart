
import 'package:flutter/material.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/screen/home_main.dart';
import 'package:untitled2/screen/account_screen.dart';
import 'package:untitled2/screen/offer_screen.dart';
import 'package:untitled2/screen/explore_screeen.dart';
import 'cart_null.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  BottomNavigationExampleState createState() =>
      BottomNavigationExampleState();
}
class BottomNavigationExampleState extends State {
  Product product= Product();
  int _selectedTab = 0;
  final List _pages = [
    const Center(
      child: HomeMain(),
    ),
     const ExporeScreen(),
    const CartScreennull(),
    const OfferScreen(),
    const AccountScreen(),

  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color(0xFFFFFFFF),
        ),
        child: BottomNavigationBar(

          selectedIconTheme: const IconThemeData(color:  Color(0xFF40BFFF), size: 27),
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: const Color(0xFF40BFFF),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(icon:Icon(Icons.shopping_cart_outlined), label: "Card",),
            BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: "Offer"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
          ],
        ),
      ),
    ),
    );
  }
}





