
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/models/Product.dart';
import 'package:untitled2/provider/cart_provider.dart';
import 'package:untitled2/screen/bottomNavigation/cart_screen.dart';
import 'package:untitled2/screen/bottomNavigation/home_main.dart';
import 'package:untitled2/screen/bottomNavigation/account_screen.dart';
import 'package:untitled2/screen/bottomNavigation/offer_screen.dart';
import 'package:untitled2/screen/bottomNavigation/explore_screeen.dart';

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
    const CartScreen(),
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
      child:Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return  Scaffold(
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

                items:  [
                  const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
                  const BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
                  BottomNavigationBarItem(
                    icon:Badge(
                      label: Text(cartProvider.cartItems.length.toString()),
                      child:const Icon(Icons.shopping_cart_outlined),
                    ), label: "Card",
                  ),
                  const BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined), label: "Offer"),
                  const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Account"),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}





