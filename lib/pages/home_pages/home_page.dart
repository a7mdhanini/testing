import 'package:flutter/material.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_container.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/pages/home_pages/show_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Home',
        ),
      ),

      ///----Body
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return MyContainer(
            onTap: () {
              Route route = MaterialPageRoute(
                builder: (_) => ShowItemPage(
                  itemId: index.toString(),
                ),
              );

              Navigator.push(context, route);
            },
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: Sizes.width(context),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXJA32WU4rBpx7maglqeEtt3ot1tPIRWptxA&s',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: Sizes.width(context),
                    child: Text(
                      'Title wlkedmw ewd kl wedekl wdwkled w ewjkdf ',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
