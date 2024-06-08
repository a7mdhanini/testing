import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('الصفحة الاولى'),
        titleSpacing: 1,
        centerTitle: true,
        elevation: 100,
        actions: [
          IconButton(
            icon: Icon(Icons.phone, color: Colors.red),
            onPressed: () {
              print('call');
            },
          ),
          IconButton(
            icon: Icon(Icons.email, color: Colors.red),
            onPressed: () {
              print('send');
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            print('print somthing!');
          },
        ),
      ),

      ///----Body
      body: Center(
        child: Container(
          width: 170,
          height: 50,
          child: OutlinedButton(
            child: Text('ok'),
            onPressed: () {},
          ),
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
