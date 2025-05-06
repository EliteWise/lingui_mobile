import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lingui_mobile/features/auth/application/states/auth_provider.dart';

class LoginEmailPage extends ConsumerStatefulWidget {
  const LoginEmailPage({super.key});

  @override
  _LoginEmailPageState createState() => _LoginEmailPageState();
}

class _LoginEmailPageState extends ConsumerState<LoginEmailPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool _loginCooldown = false;

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
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04), // Add space between elements
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
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
                  if (_loginCooldown) return;

                  _loginCooldown = true;
                  Future.delayed(const Duration(seconds: 2), () => _loginCooldown = false);
                  final authService = ref.read(authServiceProvider);

                  final email = emailController.text.trim();
                  final password = passwordController.text;

                  if (email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please enter email and password'))
                    );
                    return;
                  }

                  bool isAuthenticated = await authService.authenticateWithEmail(email, password);

                  if (!isAuthenticated) {
                    Builder(
                      builder: (context) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Authentication failed. Please try again.'))
                        );
                        return Container();
                      },
                    );
                    return;
                  }

                  context.push('/languages_selection');
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