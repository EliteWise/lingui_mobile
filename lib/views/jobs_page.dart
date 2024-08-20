import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class JobsPage extends StatelessWidget {
  final List<Map<String, String>> jobListings = [
    {
      "title": "Software Engineer",
      "location": "Remote",
      "description": "Develop and maintain mobile applications.",
    },
    {
      "title": "Product Manager",
      "location": "New York, NY",
      "description": "Lead the development of new product features."
    },
    {
      "title": "UX/UI Designer",
      "location": "San Francisco, CA",
      "description": "Design intuitive user interfaces for our applications.",
    },
    {
      "title": "Data Analyst",
      "location": "Remote",
      "description": "Analyze data to support business decisions.",
    },
  ];

  final String supportEmail = "support@yourcompany.com";

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      query: 'subject=Lingui Jobs',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      print('Could not launch $emailUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Openings"),
      ),
      body: ListView.builder(
        itemCount: jobListings.length,
        itemBuilder: (context, index) {
          final job = jobListings[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                job["title"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(job["location"]!),
                  SizedBox(height: 8.0),
                  Text(job["description"]!),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                _launchEmail();
              },
            ),
          );
        },
      ),
    );
  }
}
