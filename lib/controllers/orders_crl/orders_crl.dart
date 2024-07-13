import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:testing/constants/app_strings.dart';
import 'package:testing/models/items_model/items_model.dart';

class OrdersCrl extends GetxController {
  List<ItemsModel> ordersList = [];

  Future<List<ItemsModel>> fetchOrders() async {
    ordersList.clear();

    try {
      QuerySnapshot<Map<String, dynamic>> getData = await FirebaseFirestore
          .instance
          .collection(AppStrings.orders)
          .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      for (var doc in getData.docs) {
        ordersList.add(ItemsModel.fromQuery(doc));
      }
    } catch (e) {
      log(e.toString());
    }

    update();
    return ordersList;
  }
}
