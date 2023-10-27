import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bottom_navigation_bar.dart';
class CartScreennull extends StatelessWidget{
  const CartScreennull({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child:Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 400,
                alignment: Alignment.center,
                margin: const EdgeInsets.fromLTRB(10,10,10,10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Icon(Icons.remove_shopping_cart_outlined,color:  Color(0xFF40BFFF),size: 70,) ,
                  Container(
                    margin: const EdgeInsets.all(5),
                  ),
                  Text(
                    "Your cart is empty." ,
                    style: GoogleFonts.inter(
                      fontSize: 25.0,
                      color: const Color(0xFF9098B1),
                    ),
                  ),
                ],)
                
              ),
            
              Container(
                margin: const EdgeInsets.fromLTRB(16,16,16,16),
                child:  Row(
                  children: [
                    Text(
                      'Total Price:',
                      style:
                      Theme.of(context).textTheme.titleMedium,
                    ),
                    Expanded(child: Container()),
                    Text(
                      '\$00',
                      style:
                      Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),


              //
              GestureDetector(
                onTap: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
                },
                child:Container(
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
                  child:Text(
                    'Check out',
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
              //button checkout

            ],),
        ),

      ),
    );
  }
}
