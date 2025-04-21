import 'package:flutter/material.dart';

class LegalPrivacyPage extends StatelessWidget {
  const LegalPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Legal & Privacy"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Terms of Service"),
            subtitle: const Text("Read the terms of service"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfServicePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Privacy Policy"),
            subtitle: const Text("Read our privacy policy"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Data Storage and Usage"),
            subtitle: const Text("Learn about how we store and use your data"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DataStoragePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Legal Mentions"),
            subtitle: const Text("View legal mentions"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LegalMentionsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DataStoragePage extends StatelessWidget {
  const DataStoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Storage and Usage"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "Data Storage and Usage:\n\n"
                "1. Local Storage\n"
                "We use local storage mechanisms like SharedPreferences (Android) or NSUserDefaults (iOS) to store your preferences and small amounts of data securely on your device.\n\n"
                "2. Analytics\n"
                "We use third-party analytics tools, such as Firebase Analytics, to help us understand how you use our app and improve your experience.\n\n"
                "3. Data Security\n"
                "We implement appropriate security measures to protect your data from unauthorized access and ensure its integrity.\n\n",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class LegalMentionsPage extends StatelessWidget {
  const LegalMentionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Legal Mentions"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "Legal Mentions:\n\n"
                "1. Company Information\n"
                "Elite\n"
                "Address: [Address]\n"
                "Phone: [Phone Number]\n"
                "Email: [Company Email]\n\n"
                "2. Director of Publication\n"
                "Name: [Name of the Director]\n\n"
                "3. Hosting Provider\n"
                "Provider Name: [Hosting Provider Name]\n"
                "Address: [Hosting Provider Address]\n\n",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms of Service"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "Terms of Service:\n\n"
                "1. Introduction\n"
                "These terms of service outline the rules and regulations for the use of our application...\n\n"
                "2. Intellectual Property Rights\n"
                "Other than the content you own, under these Terms, Elite and/or its licensors own all the intellectual property rights...\n\n"
                "3. Restrictions\n"
                "You are specifically restricted from all of the following...\n\n",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            "Privacy Policy:\n\n"
                "1. Information Collection\n"
                "We collect various types of information in connection with the services we provide...\n\n"
                "2. Use of Information\n"
                "The information we collect is used for the following purposes...\n\n"
                "3. Sharing of Information\n"
                "We may share your information with the following entities...\n\n",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}