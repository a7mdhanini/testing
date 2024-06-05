import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.amber,
            gradient: LinearGradient(
              tileMode: TileMode.repeated,
              // stops: [
              //   0.1,
              //   0.8,
              //   0.9,
              // ],
              begin: Alignment.bottomLeft,
              end: Alignment.topLeft,
              colors: [
                Colors.green,
                Colors.red,
              ],
            ),
            // border: Border.all(
            //   color: Colors.red,
            //   width: 4,
            // ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.blue.shade200,
            //     offset: Offset(10, -5),
            //     blurRadius: 10,
            //     spreadRadius: 10,
            //     blurStyle: BlurStyle.normal,
            //   ),
            // ],
          ),

          // margin: EdgeInsets.only(left: 20),
          // padding: EdgeInsets.only(left: 20),
        ),
      ),
    );
  }

  ElevatedButton myButton() {
    return ElevatedButton(
      onPressed: () {
        log('you have clicked me');
      },
      child: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Tap me',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w800,
        letterSpacing: 3,
      ),
    );
  }
}
