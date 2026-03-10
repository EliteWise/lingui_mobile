import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lingui_mobile/features/community/application/states/community_provider.dart';
import 'package:lingui_mobile/features/community/data/profile_update.dart';
import 'package:lingui_mobile/features/onboarding/application/states/onboarding_provider.dart';
import 'package:lingui_mobile/features/settings/presentation/support_help_page.dart';

import '../../auth/application/states/auth_provider.dart';
import '../../community/data/profile.dart';
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
          ProfileSection(),
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

class ProfileSection extends ConsumerStatefulWidget {

  const ProfileSection({super.key});

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _locationController;
  late TextEditingController _pictureUrlController;
  late TextEditingController _nativeLanguageController;
  late TextEditingController _birthdateController; // on gère la date en string ISO

  Map<String, int> _learningLanguages = {};
  Set<String> _badges = {};

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final profile = ref.read(fetchProfileProvider).maybeWhen(
      data: (profile) => profile,
      orElse: () => null,
    );

    _nameController = TextEditingController(text: profile?.name ?? '');
    _descriptionController = TextEditingController(text: profile?.description ?? '');
    _locationController = TextEditingController(text: profile?.location ?? '');
    _pictureUrlController = TextEditingController(text: profile?.pictureUrl ?? '');
    _nativeLanguageController = TextEditingController(text: profile?.nativeLanguage ?? '');
    _birthdateController = TextEditingController(text: profile?.birthdate?.toIso8601String() ?? '');

    _learningLanguages = profile?.learningLanguages ?? {};
    _badges = profile?.badges ?? {};
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _pictureUrlController.dispose();
    _nativeLanguageController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final profileId = await ref.read(appwriteAuthProvider).currentUserId;
      if (profileId == null) throw Exception('User not logged in');

      final birthdate = DateTime.tryParse(_birthdateController.text.trim());

      final update = ProfileUpdate(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        pictureUrl: _pictureUrlController.text.trim(),
        nativeLanguage: _nativeLanguageController.text.trim(),
        birthdate: birthdate,
        learningLanguages: _learningLanguages,
        badges: _badges,
      );

      final communityService = ref.read(communityServiceProvider);
      await communityService.updateProfile(profileId, update);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit Profile",
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Display Name",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              validator: (value) => (value == null || value.trim().isEmpty) ? "Please enter your name" : null,
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Bio / Description",
                hintText: "Tell us something about you...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _pictureUrlController,
              decoration: InputDecoration(
                labelText: "Picture URL",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _nativeLanguageController,
              decoration: InputDecoration(
                labelText: "Native Language",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: _birthdateController,
              decoration: InputDecoration(
                labelText: "Birthdate",
                hintText: "YYYY-MM-DD",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSaving ? null : _saveChanges,
                icon: _isSaving
                    ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
                    : const Icon(Icons.save),
                label: Text(_isSaving ? "Saving..." : "Save Changes"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
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


