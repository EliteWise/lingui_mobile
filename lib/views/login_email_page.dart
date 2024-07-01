import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'discussion_page.dart';

class LoginEmailPage extends StatelessWidget {
  const LoginEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login-background.jpg'),
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
                "Welcome on Lingui !",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
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
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFF4500)),
                  minimumSize: MaterialStateProperty.all(Size(200, 45)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => DiscussionPage()
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