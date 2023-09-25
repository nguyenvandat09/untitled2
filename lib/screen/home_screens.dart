
import 'package:flutter/material.dart';
import 'package:untitled2/screen/Home_main.dart';
import 'package:untitled2/screen/account_screen.dart';
import 'package:untitled2/screen/offer_screen.dart';
import 'package:untitled2/screen/Explore_screeen.dart';
import 'package:untitled2/screen/cart_screen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}
class _BottomNavigationExampleState extends State {
  int _selectedTab = 0;

  final List _pages = [
    const Center(
      child: HomeMain(),
    ),
     const ExporeScreen(),
    const CartScreen(),
    const OfferScreen(),
    const AcccountScreen(),

  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          // showSelectedLabels: false,
           showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Card"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_offer_outlined), label: "Offer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "Account"),
          ],
        ),
      ),
    );
  }
}




