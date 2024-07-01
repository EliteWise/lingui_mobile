import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lingui_mobile/views/login_email_page.dart';

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
              SizedBox(height: MediaQuery.of(context).size.height * 0.08), // Add space between elements
              ElevatedButton.icon(
                icon: Icon(FontAwesomeIcons.google, color: Colors.white),
                label: Text('Login with Google',
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
              ElevatedButton.icon(
                icon: Icon(FontAwesomeIcons.facebookF, color: Colors.white),
                label: Text('Login with Facebook',
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              const Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                  Text("  or  ", style: TextStyle(color: Colors.white)),
                  Expanded(
                    child: Divider(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ElevatedButton.icon(
                icon: Icon(Icons.email, color: Colors.white),
                label: Text('Login with Email',
                    style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFFF4500)),
                  minimumSize: MaterialStateProperty.all(Size(200, 45)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(pageBuilder: (_, __, ___) => LoginEmailPage()
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