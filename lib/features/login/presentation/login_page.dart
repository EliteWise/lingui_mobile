import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/features/chat/application/isar_service.dart';
import 'package:lingui_mobile/features/chat/data/message.dart';
import 'package:lingui_mobile/features/login/application/auth_service.dart';
import 'package:lingui_mobile/features/login/application/states/provider_appwrite.dart';

import '../../../common_widgets/navigation.dart';
import '../../chat/presentation/discussion_page.dart';
import 'login_email_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login-background.jpeg'),
              fit: BoxFit.cover,
            )
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min, // Minimizes the size of Column to its children
            children: [
              const Text(
                "Lingui",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08), // Add space between elements
              ElevatedButton.icon(
                icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
                label: const Text('Login with Google',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xFF795548)),
                  minimumSize: WidgetStateProperty.all(const Size(200, 45)),
                ),
                onPressed: () async {
                  final authService = ref.read(authServiceProvider);
                  bool isAuthenticated = await authService.authenticateWithGoogle();

                  if (!isAuthenticated) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Authentication failed. Please try again.'))
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Navigation()
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ElevatedButton.icon(
                icon: const Icon(FontAwesomeIcons.facebookF, color: Colors.white),
                label: const Text('Login with Facebook',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xFF795548)),
                  minimumSize: WidgetStateProperty.all(const Size(200, 45)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => const DiscussionPage()
                    ),
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                  Text("  or  ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton.icon(
                icon: const Icon(Icons.email, color: Colors.white),
                label: const Text('Login with Email',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xFF795548)),
                  minimumSize: WidgetStateProperty.all(const Size(200, 45)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginEmailPage()
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}