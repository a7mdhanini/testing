import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 171, 64, 1),
        title: Text('Home'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Search Page')],
      ),
    );
  }
}
