import 'package:get/get.dart';
import 'package:testing/controllers/admin_crl/admin_create_crl.dart';
import 'package:testing/controllers/admin_crl/admin_crl.dart';
import 'package:testing/controllers/auth_crl/auth_crl.dart';
import 'package:testing/controllers/contact_us_crl/contact_us_crl.dart';
import 'package:testing/controllers/home_crl/home_crl.dart';
import 'package:testing/controllers/localization_crl.dart';
import 'package:testing/controllers/nav_crl/navigation_crl.dart';
import 'package:testing/controllers/orders_crl/orders_crl.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthCrl());
    Get.put(NavigationCrl());
    Get.put(AdminCreateCrl());
    Get.put(AdminCrl());
    Get.put(HomeCrl());
    Get.put(OrdersCrl());
    Get.put(LocalizationCrl());
    Get.put(ConatactUsCrl());
  }
}
