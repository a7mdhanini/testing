import 'package:get/get.dart';
import 'package:testing/controllers/auth_crl/auth_crl.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthCrl());
  }
}
