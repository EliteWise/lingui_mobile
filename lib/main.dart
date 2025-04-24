import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/chat/application/isar_service.dart';

import 'features/login/presentation/login_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final isarService = IsarService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarService.openIsarDatabase();
  runApp(const ProviderScope(
    child: LinguiMobile(),
  ));
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
      navigatorKey: navigatorKey,
      home: const LoginPage(),
    );
  }

}