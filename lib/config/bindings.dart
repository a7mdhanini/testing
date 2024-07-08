import 'package:get/get.dart';
import 'package:testing/controllers/admin_crl/admin_create_crl.dart';
import 'package:testing/controllers/admin_crl/admin_crl.dart';
import 'package:testing/controllers/auth_crl/auth_crl.dart';
import 'package:testing/controllers/nav_crl/navigation_crl.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthCrl());
    Get.put(NavigationCrl());
    Get.put(AdminCreateCrl());
    Get.put(AdminCrl());
  }
}
