import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/constants/app_strings.dart';
import 'package:testing/controllers/orders_crl/orders_crl.dart';
import 'package:testing/models/items_model/items_model.dart';

class HomeCrl extends GetxController {
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

  Future<void> orderItem(BuildContext context, ItemsModel itemsModel) async {
    DocumentReference ref =
        FirebaseFirestore.instance.collection(AppStrings.orders).doc();

    itemsModel.userId = FirebaseAuth.instance.currentUser!.uid;
    itemsModel.orderTime = DateTime.now().toString();

    itemsModel.quintity = '3';
    log(itemsModel.orderTime);
    ref.set(itemsModel.toMap()).then((val) {
      log('Done');
    });

    Get.find<OrdersCrl>().ordersList.add(itemsModel);
    Get.find<OrdersCrl>().update();

    Navigator.pop(context);
    update();
  }
}
