import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_container.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/home_crl/home_crl.dart';
import 'package:testing/pages/home_pages/show_item_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<HomeCrl>().fetchAllData(),
      builder: (context, snapshot) {
        return Scaffold(
          ///---AppBar
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: MyAppBar(
              title: 'Home',
            ),
          ),

          ///----Body
          body: GetBuilder<HomeCrl>(
              init: HomeCrl(),
              builder: (crl) {
                return GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: crl.itemsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyContainer(
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (_) => ShowItemPage(
                            itemsModel: crl.itemsList[index],
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
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: crl.itemsList[index].image,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // child:    Image.network(
                              //       crl.itemsList[index].image,
                              //       fit: BoxFit.cover,
                              //     ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 50,
                              width: Sizes.width(context),
                              child: Text(
                                crl.itemsList[index].title,
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
                );
              }),
        );
      },
    );
  }
}
