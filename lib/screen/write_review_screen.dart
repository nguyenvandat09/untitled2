import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/main.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:untitled2/screen/componets/details_screen.dart';
import 'package:toast/toast.dart';
import 'package:untitled2/screen/list/list_review_screen.dart';

// ignore: camel_case_types
class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  @override
  State<AddReviewScreen> createState() => ListReviewState();
}
class MyFormReview extends StatefulWidget {
  const MyFormReview({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}
int myCount=5;
void showToast(String msg, {int? duration, int? gravity}) {
  Toast.show(msg, duration: duration, gravity: gravity,);
}
class MyCustomFormState extends State<MyFormReview> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  Future addReview() async{
    // Getting value from Controller
    String contents = emailController.text;

    DateTime now = DateTime.now();
    // var data = {'contents': contents, 'idUser' : id_, 'idProduct': 1, 'ratting': myCount, 'createAts': now.toString()};
    // print(data);


    var response = await http.post(
        Uri.parse('http://localhost:3000/api/reviews'),
        body: json.encode({
          'contents' : contents,
          'idUser' : id_,
          'idProduct': idProduct_,
          'ratting': myCount,
          'createdAts': now.toString(),
          'pictureReview':'https://preview.keenthemes.com/metronic8/demo1/assets/media//stock/ecommerce/1.png',
          'likeCount':0,
        }),
        headers: {
          'Content-Type': 'application/json'
        }
    );
     jsonDecode(response.body);


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
            height: 120,
            padding:  const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric( vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1.0,
                color: const Color(0xFFEFEFEF),
              ),
            ),
            child: TextFormField(
              minLines: 10, // any number you need (It works as the rows for the textarea)
              keyboardType: TextInputType.multiline,
              maxLines: null,
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
              cursorColor: const Color(0xFF15224F),
              decoration: const InputDecoration(
                  hintText:' Write your review here',
                  labelStyle: TextStyle(
                    fontSize: 9.0,
                    color: Color(0xFF969AA8),
                  ),
                  border: InputBorder.none
              ),
            ),
          ),

          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            margin:const EdgeInsets.symmetric(horizontal: 10),
            child:  const Text(
              'Add Photo',
              style:TextStyle(
                  fontSize: 17,
                  color: Color(0xFF223263)
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin:const EdgeInsets.symmetric(vertical: 16),
                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1.0,
                    color: const Color(0xFFEFEFEF),
                  ),
                ),
                child: IconButton(
                  onPressed: () {  },
                  icon:const Icon(Icons.add) ,
                  iconSize: 15,
                ),
              ),
            ],
          ),


          Container(
            margin:const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 53,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    addReview();

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeListReviewPage()),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  //shape: const StadiumBorder()
                ),
                child: const Text("Submit"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ListReviewState extends State<AddReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: product.bgColor,
      appBar: AppBar(
        backgroundColor:  Colors.white,
        leading: const BackButton(color: Color(0xFF40BFFF)),
        title: const Text(
          "Write Review",
          style: TextStyle(
            color: Color(0xFF223263),
            fontSize: 18,
          ),
        ),

      ),
      body:  SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(20),
          child:  Column(
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Please write Overall level of satisfaction with your shipping / Delivery Service',
                style:TextStyle(
                    fontSize: 17,
                    color: Color(0xFF223263)
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric( vertical: 16),
              ),
              FivePointedStar(

                defaultSelectedCount:5 ,
                count: 5,
                selectedColor:const Color(0xFFFFEB00),
                size: const Size(25,25),
                onChange: (count) {
                  setState(() {

                    myCount = count;
                  });
                },
              ),
              Row(
                children: [
                  Container(
                    margin:const EdgeInsets.symmetric(vertical: 10),
                    child:  const Text(
                      'Write Your Review',
                      style:TextStyle(
                          fontSize: 17,
                          color: Color(0xFF223263)
                      ),
                    ),
                  ),
                ],
              ),
              const MyFormReview(),
            ],
          ),


        ),

      ),

    );
  }
}

