import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lingui_mobile/firebase_options.dart';
import 'package:lingui_mobile/views/country_folder_page.dart';
import 'package:lingui_mobile/views/login_page.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if(Platform.isAndroid) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize("bc2db3a0-aac8-4457-9897-d763cd94ae4d");
    OneSignal.Notifications.requestPermission(true);
  }

  runApp(const LinguiMobile());
}

class LinguiMobile extends StatelessWidget {
  const LinguiMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lingui Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CountryFolderPage(),
    );
  }


}