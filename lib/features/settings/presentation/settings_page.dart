import 'package:flutter/material.dart';
import 'package:lingui_mobile/features/settings/presentation/support_help_page.dart';

import '../../job/presentation/jobs_page.dart';
import 'legal_privacy_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          const AccountSection(),
          const NotificationsSection(),
          ExpansionTile(
            title: const Row(
              children: [
                Icon(Icons.security_update_good_rounded),
                SizedBox(width: 16.0),
                Text('Privacy & Security')
              ],
            ),
            children: [
              SwitchItem(name: "Display my status", initialSwitchValue: true, onChanged: (bool value) {}),
              SwitchItem(name: "Show my location", initialSwitchValue: true, onChanged: (bool value) {}),
              SwitchItem(name: "Show following list", initialSwitchValue: false, onChanged: (bool value) {}),
            ],
          ),

          const Divider(),

          SettingItem(icon: Icons.privacy_tip, title: 'Legal & Privacy', onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LegalPrivacyPage()),
            );
          }),
          SettingItem(icon: Icons.support, title: 'Support & Help', onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SupportHelpPage())
            );
          }),
          SettingItem(icon: Icons.work, title: 'Jobs', onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JobsPage())
            );
          }),
        ]
      )
    );
  }
}

class SwitchItem extends StatefulWidget {
  final IconData? icon;
  final String name;
  final bool initialSwitchValue;
  final ValueChanged<bool> onChanged;

  const SwitchItem({
    super.key,
    this.icon,
    required this.name,
    this.initialSwitchValue = false,
    required this.onChanged
  });

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialSwitchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          if(widget.icon != null) Icon(widget.icon, size: 28.0),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              widget.name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Switch(
            value: isActive,
            onChanged: (bool value) {
              setState(() {
                isActive = value;
              });
              print('Switch changed: $isActive');
              widget.onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}


class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool expansionTile;
  final VoidCallback onTap;

  const SettingItem({super.key, required this.icon, required this.title, this.expansionTile = false, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if(expansionTile) {
      return ExpansionTile(
          title: Row(
            children: [
              Icon(icon),
              const SizedBox(width: 16.0),
              Text(title),
            ],
          ),
        children: const [
          Text("Option 1")
        ],
      );
    } else {
      return ListTile(
        title: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16.0),
            Text(title)
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      );
    }
  }
}

class NotificationsSection extends StatefulWidget {
  const NotificationsSection({super.key});

  @override
  State<NotificationsSection> createState() => _NotificationsSectionState();
}

class _NotificationsSectionState extends State<NotificationsSection> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Row(
          children: [
            Icon(Icons.notifications),
            SizedBox(width: 16.0),
            Text("Notifications")
          ],
      ),
      children: [
            SwitchItem(name: "Messages Received", initialSwitchValue: true, onChanged: (bool value) {}),
            SwitchItem(name: "New Followers", initialSwitchValue: true, onChanged: (bool value) {}),
            SwitchItem(name: "Daily Alert", initialSwitchValue: true, onChanged: (bool value) {}),
            SwitchItem(name: "Appreciations Received", initialSwitchValue: true, onChanged: (bool value) {}),
      ],
    );
  }
}

class AccountSection extends StatefulWidget {
  const AccountSection({super.key});

  @override
  State<AccountSection> createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Row(
        children: [
          Icon(Icons.account_circle),
          SizedBox(width: 16.0),
          Text("Account"),
        ],
      ),
      children: [
        ListTile(
          title: const Text("Email"),
          subtitle: const Text("example@example.com"), // Remplacez par l'email actuel
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()),
            );
          },
        ),
        ListTile(
          title: const Text("Password"),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()),
            );
          },
        ),
        ListTile(
          title: const Text("Link Google Account"),
          subtitle: const Text("Not Linked"), // Remplacez par l'état actuel de l'association
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()),
            );
          },
        ),
        ListTile(
          title: const Text("Link Facebook Account"),
          subtitle: const Text("Not Linked"), // Remplacez par l'état actuel de l'association
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Container()),
            );
          },
        ),
      ],
    );

  }
}


