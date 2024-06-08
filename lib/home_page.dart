import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home Page'),
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
        child: InkWell(
          onLongPress: () {
            log('hi');
          },
          child: Text('hello'),
        ),
      ),
    );
  }
}
