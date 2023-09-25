import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CartScreen extends StatelessWidget{
  const CartScreen({super.key});

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
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Image.asset(
                    'assets/product.png',
                    height: 72,
                    width: 72,
                  ),
                   Column(children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children:  [
                        const Text("Nike Air Zoom Pegasus 36 ",
                         style: TextStyle(color: Colors.black,fontSize: 12),
                       ),
                       Container(
                         margin: const EdgeInsets.fromLTRB(5,0,0,0),
                       child:Image.asset(
                         'assets/traitim.png',
                         height: 24,
                         width: 24,
                       ),
                       ),
                       IconButton(
                         icon:const Icon(Icons.delete_outline) ,
                         iconSize: 24,
                         onPressed: () {
                         },
                       ),
                     ],),
                     Row(
                       children: [
                         const Text("\$299,43",
                           style: TextStyle(color: Color(0xFF3AD9F6),fontSize: 12),
                         ),

                         Container(
                           padding: const EdgeInsets.all(15),
                           margin: const EdgeInsets.fromLTRB(20,0,0,0),
                           decoration: const BoxDecoration(
                             color: Color(0xFFFFFFFF),
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                           ),
                           child: const Text("-",
                             style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                           ),
                         ),
                         Container(
                           padding: const EdgeInsets.all(15),
                           decoration: const BoxDecoration(
                             color: Color(0xFFEBF0FF),
                             //borderRadius: BorderRadius.all(Radius.circular(12.0)),
                           ),
                           child: const Text("1",
                             style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                           ),
                         ),
                         Container(
                           padding: const EdgeInsets.all(15),
                           decoration: const BoxDecoration(
                             color: Color(0xFFFFFFFF),
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                           ),
                           child: const Text("+",
                             style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                           ),
                         ),
                       ],
                     ),
                   ],),

                ],)
          ),
                Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/product.png',
                          height: 72,
                          width: 72,
                        ),
                        Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [
                              const Text("Nike Air Zoom Pegasus 36 ",
                                style: TextStyle(color: Colors.black,fontSize: 12),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(5,0,0,0),
                                child:Image.asset(
                                  'assets/traitim.png',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              IconButton(
                                icon:const Icon(Icons.delete_outline) ,
                                iconSize: 24,
                                onPressed: () {
                                },
                              ),
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("\$299,43",
                                style: TextStyle(color: Color(0xFF3AD9F6),fontSize: 12),
                              ),

                              Container(
                                padding: const EdgeInsets.all(15),
                                margin: const EdgeInsets.fromLTRB(20,0,0,0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: const Text("-",
                                  style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEBF0FF),
                                  //borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                ),
                                child: const Text("1",
                                  style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                ),
                                child: const Text("+",
                                  style: TextStyle(color: Color(0xFF223263),fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],),

                      ],)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0,10,0,10),
                    width: 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        width: 1.0,
                        color: const Color(0xFFEFEFEF),
                      ),
                    ),
                    child: TextField(
                      style: GoogleFonts.inter(
                        fontSize: 16.0,
                        color: const Color(0xFF40BFFF),
                      ),
                      cursorColor: const Color(0xFF40BFFF),
                      decoration: InputDecoration(
                          hintText: 'Enter Cupon Code',
                          labelStyle: GoogleFonts.inter(
                            fontSize: 12.0,
                            color: const Color(0xFF969AA8),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
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
                      },
                      child:Text(
                        'Apply',
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
                ],),


                Container(
                  alignment: Alignment.center,
                  height: 110,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 1.0,
                      color: const Color(0xFFEFEFEF),
                    ),
                  ),
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Items (2)" ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),

                        Text(
                          "\$598.86" ,
                          style: GoogleFonts.inter(
                            fontSize: 13.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping " ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                        Text(
                          "\$40.00" ,
                          style: GoogleFonts.inter(
                            fontSize: 13.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Import charges" ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),
                        Text(
                          "\$198.86" ,
                          style: GoogleFonts.inter(
                            fontSize: 13.0,
                            color: const Color(0xFF9098B1),
                          ),
                        ),

                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price" ,
                          style: GoogleFonts.inter(
                            fontSize: 15.0,
                            color: const Color(0xFF0E0E0E),
                          ),
                        ),

                        Text(
                          "\$798.86" ,
                          style: GoogleFonts.inter(
                            fontSize: 13.0,
                            color: const Color(0xFF40BFFF),
                          ),
                        ),

                      ],
                    ),
                  ],)
                ),//
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
                    },
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
                ),//button checkout

            ],),
          ),

      ),
    );
  }
}
