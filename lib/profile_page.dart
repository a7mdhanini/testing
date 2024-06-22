import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File myImage = File('');

  Future<File> selectImage() async {
    ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        myImage = File(image.path);
      }
    });

    return myImage;
  }

  void removeImage() {
    setState(() {
      myImage = File('');
    });
  }

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
            icon: Icon(Icons.clear, color: Colors.white),
            onPressed: () {
              removeImage();
            },
          ),
        ],
        leading: const SizedBox(),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.red),
        //   onPressed: () {
        //     print('print somthing!');
        //   },
        // ),
      ),

      ///----Body
      body: Column(
        children: [
          const SizedBox(height: 70),

          ///----Image
          InkWell(
            onTap: () async {
              selectImage();
            },
            child: Visibility(
              visible: myImage.path.isEmpty,
              replacement: Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.file(myImage),
                ),
              ),
              child: Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
