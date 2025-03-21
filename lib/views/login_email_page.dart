import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/services/auth_service.dart';
import 'package:lingui_mobile/states/provider_appwrite.dart';
import 'package:lingui_mobile/widgets/navigation.dart';

import 'discussion_page.dart';

class LoginEmailPage extends ConsumerStatefulWidget {
  const LoginEmailPage({super.key});

  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends ConsumerState<LoginEmailPage> {

  late String email;
  late String password;

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
                obscureText: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05), // Add space between elements
              ElevatedButton.icon(
                icon: const Icon(Icons.email, color: Colors.white),
                label: const Text('Login with Email',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(Color(0xFF795548)),
                  minimumSize: WidgetStateProperty.all(const Size(200, 45)),
                ),
                onPressed: () async {
                  // TODO: move all that to a dedicated method (-> inside auth service)
                  final authService = ref.read(authServiceProvider);
                  if (await authService.userExists(email)) {
                    await authService.login(email, password);
                  } else {
                    await authService.register(email, password);
                  }

                  if(!(await authService.isAppwriteSignedIn)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('An error has been encountered, please retry'))
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
              TextButton(
                  onPressed: () {

                  },
                  child: const Text('Forgot Password?',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}