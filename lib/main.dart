import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/config/bindings.dart';
import 'package:testing/firebase_options.dart';
import 'package:testing/getx/page_1.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: Page1(),
      // ),
    );
  }
}
