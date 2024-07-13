import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/home_crl/home_crl.dart';
import 'package:testing/models/items_model/items_model.dart';

class ShowItemPage extends StatelessWidget {
  final ItemsModel itemsModel;

  const ShowItemPage({required this.itemsModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: '',
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Sizes.height(context) / 2.5,
              width: Sizes.width(context),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: itemsModel.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: Sizes.width(context),
                child: Text(
                  itemsModel.title,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Text(
                  itemsModel.description,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 90,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GetBuilder<HomeCrl>(
              builder: (crl) {
                return MyButton(
                  title: 'Order Item',
                  onPressed: () {
                    crl.orderItem(context, itemsModel);
                  },
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
