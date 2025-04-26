import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _AvatarBadgesPageState();
}

class _AvatarBadgesPageState extends State<ProfileInfoPage> {
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
              onPressed: () {
                context.go('/navigation');
              },
              child: const Text('Finish'),
            ),
          ],
        ),
      ),
    );
  }
}