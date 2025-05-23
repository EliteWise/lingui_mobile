import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingui_mobile/common_services/states/image_provider.dart';
import 'package:lingui_mobile/features/community/data/profile.dart';
import 'package:lingui_mobile/features/onboarding/application/states/onboarding_provider.dart';
import 'package:appwrite/models.dart' as models;

class ProfileInfoPage extends ConsumerStatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  ConsumerState<ProfileInfoPage> createState() => _AvatarBadgesPageState();
}

class _AvatarBadgesPageState extends ConsumerState<ProfileInfoPage> {
  XFile? image;
  final List<String> allBadges = ['👋 Friendly', '🎓 Serious Learner', '🎤 Wants to speak', '📝 Prefers text'];
  final Set<String> selectedBadges = {};
  DateTime? birthdate;

  Future<void> _pickImage() async {
    final XFile? picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => image = picked);
  }

  void _toggleBadge(String badge) {
    setState(() {
      if (selectedBadges.contains(badge)) {
        selectedBadges.remove(badge);
      } else {
        selectedBadges.add(badge);
      }
    });
  }

  Future<void> _selectBirthDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) setState(() => birthdate = picked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar & Badges')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null ? FileImage(File(image!.path)) : null,
                child: image == null ? const Icon(Icons.camera_alt, size: 30) : null,
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.center,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _selectBirthDate,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  birthdate == null
                      ? 'Select your birthdate'
                      : '${birthdate!.day}/${birthdate!.month}/${birthdate!.year}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 12,
              children: allBadges.map((badge) {
                final selected = selectedBadges.contains(badge);
                return FilterChip(
                  label: Text(badge),
                  selected: selected,
                  onSelected: (_) => _toggleBadge(badge),
                );
              }).toList(),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                final messenger = ScaffoldMessenger.of(context);

                if (selectedBadges.isNotEmpty && birthdate != null) {
                  if (messenger.mounted) {
                    messenger.hideCurrentMaterialBanner();
                  }
                  // TODO: upload image to appwrite storage and get image url
                  final image = this.image;
                  late String appwriteImageUrl = '';
                  if (image != null) {
                    final imageService = ref.read(imageServiceProvider);
                    appwriteImageUrl = await imageService.uploadProfileImage(image.path);
                  }

                  ref.read(profileInfoProvider).addProfileInfo(Profile.info(birthdate: birthdate, badges: selectedBadges, pictureUrl: appwriteImageUrl));
                  context.go('/navigation');
                } else {

                  messenger.showMaterialBanner(
                    MaterialBanner(
                      content: const Text('Please enter your birthdate, and select at least one badge.'),
                      backgroundColor: Colors.redAccent,
                      actions: [
                        TextButton(
                          onPressed: () {
                            messenger.hideCurrentMaterialBanner();
                          },
                          child: const Text(''),
                        ),
                      ],
                    )
                  );
                }
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}