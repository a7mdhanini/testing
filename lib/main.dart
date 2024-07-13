import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/config/shared_db.dart';
import 'package:testing/utils/firebase_options.dart';
import 'package:testing/start/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.initialize('275c7c93-96a0-4c93-93c3-8abcaf3ff41a');
  OneSignal.Notifications.requestPermission(true);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  SharedDb.sharedPreferences = await SharedPreferences.getInstance();
  // if (!kIsWeb) {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // }

  runApp(const MyApp());
}
