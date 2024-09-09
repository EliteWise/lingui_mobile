import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SupportHelpPage extends StatefulWidget {
  const SupportHelpPage({super.key});

  @override
  _SupportHelpPageState createState() => _SupportHelpPageState();
}

class _SupportHelpPageState extends State<SupportHelpPage> {
  final List<Map<String, String>> _faqItems = [
    {
      "question": "How do I reset my password?",
      "answer": "To reset your password, go to the Account Settings, select 'Change Password', and follow the instructions."
    },
    {
      "question": "How can I update my email address?",
      "answer": "You can update your email address by navigating to the Account Settings and selecting 'Update Email'."
    },
    {
      "question": "What should I do if I find a bug?",
      "answer": "If you find a bug, please report it through the 'Contact Support' section below or via the feedback option in the app."
    },
    {
      "question": "How do I delete my account?",
      "answer": "To delete your account, please contact our support team directly. They will guide you through the process."
    },
    {
      "question": "Is my data safe?",
      "answer": "Yes, we use industry-standard encryption to protect your data. Please refer to our Privacy Policy for more details."
    },
  ];

  List<Map<String, String>> _filteredFaqItems = [];

  @override
  void initState() {
    super.initState();
    _filteredFaqItems = _faqItems; // Initialize with all FAQ items
  }

  void _filterFAQ(String query) {
    final filtered = _faqItems.where((faq) {
      final questionLower = faq['question']!.toLowerCase();
      final queryLower = query.toLowerCase();
      return questionLower.contains(queryLower);
    }).toList();

    setState(() {
      _filteredFaqItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support & Help"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildContactSupportSection(context),
          const SizedBox(height: 24.0),
          _buildSearchBar(),
          const SizedBox(height: 16.0),
          _buildFAQSection(),
          const SizedBox(height: 24.0),
          _buildSupportEmail(),
        ],
      ),
    );
  }

  Widget _buildContactSupportSection(BuildContext context) {
    return ListTile(
      title: const Text("Contact Support"),
      subtitle: const Text("Need help? Contact our support team."),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ContactSupportPage()),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: const InputDecoration(
        labelText: "Search FAQ",
        hintText: "Enter keywords to quickly find answers",
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (query) {
        _filterFAQ(query);
      },
    );
  }

  Widget _buildFAQSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _filteredFaqItems.map((faq) {
        return _buildFAQItem(
          question: faq['question']!,
          answer: faq['answer']!,
        );
      }).toList(),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Text(answer),
        ],
      ),
    );
  }

  Widget _buildSupportEmail() {
    const supportEmail = "support@yourcompany.com";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Support Email",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        GestureDetector(
          onTap: () {
            Clipboard.setData(const ClipboardData(text: supportEmail));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email address copied to clipboard")),
            );
          },
          child: const Text(
            supportEmail,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class ContactSupportPage extends StatelessWidget {
  const ContactSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Support"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "We're here to help!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "If you need assistance, please provide details about your issue or question. Our support team will get back to you as soon as possible.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Your Email",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Subject",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: "Message",
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Action to submit the support request
              },
              child: const Text("Send Message"),
            ),
          ],
        ),
      ),
    );
  }
}
