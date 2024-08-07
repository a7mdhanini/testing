import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_container.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/admin_crl/admin_crl.dart';
import 'package:testing/pages/admin_pages/admin_add_item_page.dart';
import 'package:testing/pages/home_pages/show_item_page.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Get.find<AdminCrl>().fetchAllData(),
        builder: (context, snapshot) {
          return GetBuilder<AdminCrl>(
            init: AdminCrl(),
            builder: (adminCrl) {
              return Scaffold(
                ///---AppBar
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: MyAppBar(
                    title: 'C-Panel',
                  ),
                ),

                // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Get.to(const AdminAddItemPage());
                  },
                  backgroundColor: AppColors.orange,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                ),

                ///----Body
                body: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: adminCrl.itemsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MyContainer(
                      onTap: () {
                        Route route = MaterialPageRoute(
                          builder: (_) => ShowItemPage(
                            itemsModel: adminCrl.itemsList[index],
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
                                adminCrl.itemsList[index].image,
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
                                adminCrl.itemsList[index].title,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontSize: Sizes.allSizes(context) / 80,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  adminCrl.deleteItem(
                                    adminCrl.itemsList[index].id,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
