import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      endDrawer: Drawer(
        backgroundColor: Colors.pink,
        elevation: 199,
        child: Text('hhashdhashdahs  asdhasdh'),
      ),

      drawer: Drawer(
        backgroundColor: Colors.orange,
        elevation: 199,
        child: Text('hhashdhashdahs  asdhasdh'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.place),
        onPressed: () {},
      ),

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('Profile Page'),
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
        leading: SizedBox(),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.red),
        //   onPressed: () {
        //     print('print somthing!');
        //   },
        // ),
      ),

      ///----Body
      body: Center(
        child: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
