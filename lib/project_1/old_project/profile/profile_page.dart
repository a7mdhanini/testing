import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/project_1/old_project/profile/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      endDrawer: const Drawer(
        backgroundColor: Colors.pink,
        elevation: 199,
        child: Text('hhashdhashdahs  asdhasdh'),
      ),

      drawer: const Drawer(
        backgroundColor: Colors.orange,
        elevation: 199,
        child: Text('hhashdhashdahs  asdhasdh'),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.place),
        onPressed: () {},
      ),

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Profile Page'),
        titleSpacing: 1,
        centerTitle: true,
        elevation: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.clear, color: Colors.white),
            onPressed: () {
              context.read<ProfileController>().removeImage();

              // Provider.of<ProfileController>(context, listen: false)
              //     .removeImage();
            },
          ),
        ],
        leading: const SizedBox(),
      ),

      ///----Body
      body: Column(
        children: [
          const SizedBox(height: 70),

          ///----Image
          Consumer<ProfileController>(
            builder: (context, provider, child) {
              return InkWell(
                onTap: () async {
                  provider.selectImage();
                },
                child: Visibility(
                  visible:
                      context.watch<ProfileController>().myImage.path.isEmpty,
                  replacement: Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.file(provider.myImage),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
