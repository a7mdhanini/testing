import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing/utils/firebase_options.dart';
import 'package:testing/start/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (!kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  // }

  runApp(const MyApp());
}
