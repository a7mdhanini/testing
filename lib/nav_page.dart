import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing/home_page.dart';
import 'package:testing/profile_page.dart';
import 'package:testing/search_page.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  List<Widget> pagesList = [
    const HomePage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pagesList[currentIndex],

      ///----Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.cyan,

        elevation: 1,
        // iconSize: 80,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          log('index: ' + index.toString());
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
