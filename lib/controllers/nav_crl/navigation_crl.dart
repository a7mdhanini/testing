import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationCrl extends GetxController {
  int selectedIndex = 0;

  String currentPage = "Page1";

  List<String> pageKeysList = [
    "Page1",
    "Page2",
    "Page3",
  ];

  final navigationKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };

  void selectTap(String tabItem, int index) {
    if (tabItem == currentPage) {
      navigationKeys.forEach((key, value) {
        value.currentState!.popUntil((route) => route.isFirst);
      });
    } else {
      currentPage = pageKeysList[index];
      selectedIndex = index;
    }

    update();
  }
}
