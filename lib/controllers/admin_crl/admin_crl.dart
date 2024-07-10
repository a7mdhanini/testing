import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:testing/constants/app_strings.dart';
import 'package:testing/models/items_model/items_model.dart';

class AdminCrl extends GetxController {
  List<ItemsModel> itemsList = [];
  Future<List<ItemsModel>> fetchAllData() async {
    itemsList.clear();

    try {
      QuerySnapshot<Map<String, dynamic>> getData =
          await FirebaseFirestore.instance
              .collection(AppStrings.items)
              // .where('quintity', isEqualTo: '3')
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> element
          in getData.docs) {
        itemsList.add(ItemsModel.fromQuery(element));
      }
    } catch (e) {
      log(e.toString());
    }

    update();
    return itemsList;
  }

  Future<void> deleteItem(String itemId) async {
    itemsList.removeWhere((item) => item.id == itemId);

    await FirebaseFirestore.instance
        .collection(AppStrings.items)
        .doc(itemId)
        .delete();

    update();
  }
}
