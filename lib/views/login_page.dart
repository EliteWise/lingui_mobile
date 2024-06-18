import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'discussion_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
              const SizedBox(height: 16.0), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
              ),
              const SizedBox(height: 16.0), // Add space between elements
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xFFFFFFFF),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16.0), // Add space between elements
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFF4500)),
                ),
                onPressed: () {
                  Navigator.push(
                  context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => DiscussionPage()
                    ),
                  );
                },
                child: const Text("Login with Email  ",
                style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFF4500)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => DiscussionPage()
                    ),
                  );
                },
                child: const Text("Login with Google",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}