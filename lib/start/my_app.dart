import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:testing/config/bindings.dart';
import 'package:testing/controllers/localization_crl.dart';
import 'package:testing/l10n/l10n.dart';
import 'package:testing/start/init_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationCrl>(
      init: LocalizationCrl(),
      builder: (localCrl) {
        return GetMaterialApp(
          initialBinding: MyBindings(),
          debugShowCheckedModeBanner: false,
          title: 'Avocado Software',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            
            useMaterial3: true,
          ),
          locale: localCrl.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.allLang,
          home: const InitPage(),
        );
      },
    );
  }
}
