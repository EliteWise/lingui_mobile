import 'package:flutter/material.dart';
import 'package:lingui_mobile/views/country_folder_page.dart';
import 'package:lingui_mobile/views/login_page.dart';
import 'package:lingui_mobile/views/navigation_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const LoginPage(),
    );
  }

}