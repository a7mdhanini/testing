import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/old_project/profile/profile_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Search Page'),
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
        child: SizedBox(
          width: 170,
          height: 50,
          child: OutlinedButton(
            child: const Text(
              'Show Bottom Sheet',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              Provider.of<ProfileController>(context, listen: false)
                  .removeImage();
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       height: MediaQuery.of(context).size.height  ,
              //       width: MediaQuery.of(context).size.width,
              //       color: Colors.amber,
              //       child: Text('skjdns'),
              //     );
              //   },
              // );
            },
          ),
        ),
      ),
    );
  }
}
