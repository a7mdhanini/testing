import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/config/shared_db.dart';

class LocalizationCrl extends GetxController {
  Locale _local =
      Locale(SharedDb.sharedPreferences!.getString(SharedDb.localCode) ?? 'en');

  Locale get locale => _local;

  void setLocal(Locale newLocale) {
    _local = newLocale;

    SharedDb.sharedPreferences!
        .setString(SharedDb.localCode, newLocale.languageCode);

    Get.updateLocale(newLocale);

    update();

  }
}
