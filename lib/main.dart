import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/chat/application/isar_service.dart';
import 'package:lingui_mobile/router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final isarService = IsarService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await isarService.openIsarDatabase();
  await dotenv.load();
  runApp(const ProviderScope(
    child: LinguiMobile(),
  ));
}

class LinguiMobile extends StatelessWidget {
  const LinguiMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Lingui Mobile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }

}