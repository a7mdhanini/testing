import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile/profile_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Search Page'),
        titleSpacing: 1,
        centerTitle: true,
        elevation: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.red),
            onPressed: () {
              if (kDebugMode) {
                print('call');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.red),
            onPressed: () {
              log('send');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            log('print somthing!');
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
