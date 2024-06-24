import 'dart:developer';

import 'package:get/get.dart';
import 'package:testing/getx/user_model.dart';

class Page1Controller extends GetxController {
  Rx<UserModel> userModel = UserModel(
    name: 'ahmed',
    number: 0,
  ).obs;

  void updateData(int newNumber, String newName) {
    userModel.update((value) {
      value!.name = newName;
      value.number = newNumber;
    });
  }

  void increment() {
    // userModel.number++;
    // log(userModel.number.toString());

    update();
  }
}
