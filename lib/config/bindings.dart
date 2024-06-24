import 'package:get/get.dart';

import '../getx/page_1_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Page1Controller());
  }
}
