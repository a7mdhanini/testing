import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:testing/config/bindings.dart';
import 'package:testing/getx/page_1.dart';
import 'package:testing/old_project/nav_page.dart';
import 'package:testing/old_project/profile/profile_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => ProfileController()),
    //   ],
    //   child:

    return GetMaterialApp(
      initialBinding: MyBindings(),

      debugShowCheckedModeBanner: false,
      title: 'Avocado Software',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Page1(),
      // ),
    );
  }
}
