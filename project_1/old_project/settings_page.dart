import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              log('ok');
            },
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
              ),
              items: [
                Image.asset('assets/images/image_1.jpg'),
                const Text('hellooooo'),
                Image.network(
                    'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp')
              ],
            ),
          )

          // Image.asset('assets/images/image_1.jpg',),
          // Image.network(
          //   'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
          //   height: 500,
          //   width: 1000,
          //   fit: BoxFit.contain,
          //   color: Colors.amber,
          // ),

          // Text('this is anything')



          
        ],
      ),
    );
  }
}
