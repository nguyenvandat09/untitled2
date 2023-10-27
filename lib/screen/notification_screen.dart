import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget{
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text("Notification",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: IconButton(

                      icon: const Icon(Icons.local_offer_outlined,color:  Color(0xFF40BFFF),size: 20,),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const ChangeMailScreen()),
                        // );
                      },
                    ),
                  ),
                  const Text(
                    "Offer",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                    ),
                  ),
                ],),
                Container(
                  alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: const CircleAvatar(
                  backgroundColor: Color(0xFFFB7181),
                   radius: 10.0,
                   child: Text(
                     "3",
                     style: TextStyle(
                       color: Color(0xFFFFFFFF),
                       fontSize: 8,
                     ),
                   ),
                )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: IconButton(

                        icon: const Icon(Icons.feed_outlined,color:  Color(0xFF40BFFF),size: 20,),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const ChangeMailScreen()),
                          // );
                        },
                      ),
                    ),
                    const Text(
                      "Feed",
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),

                Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFFB7181),
                      radius: 10.0,
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 8,
                        ),
                      ),
                    )
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: IconButton(

                      icon: const Icon(Icons.notifications_none_outlined,color:  Color(0xFF40BFFF),size: 20,),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const ChangeMailScreen()),
                        // );
                      },
                    ),
                  ),
                  const Text(
                    "Activity",
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 18,
                    ),
                  ),
                ],),

                Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFFFB7181),
                      radius: 10.0,
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 8,
                        ),
                      ),
                    )
                )
              ],
            ),
          ],
        ),
        )

      ),
    );
  }
}
