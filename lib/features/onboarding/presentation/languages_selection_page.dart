import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lingui_mobile/features/onboarding/presentation/widgets/language_picker.dart';
import 'states/language_provider.dart';

class LanguagesSelectionPage extends ConsumerStatefulWidget {
  const LanguagesSelectionPage({super.key});

  @override
  _LanguagesSelectionPageState createState() => _LanguagesSelectionPageState();
}

class _LanguagesSelectionPageState extends ConsumerState<LanguagesSelectionPage> {
  String? error;

  @override
  Widget build(BuildContext context) {
    final native = ref.watch(nativeLanguageProvider);
    final learning = ref.watch(learningLanguageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Setup'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tell us your languages ✨',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your native language and the one you’re learning.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 66),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LanguagePicker(
                        titleText: 'Native Language',
                        provider: nativeLanguageProvider,
                        icon: Icons.language
                    ),

                    const SizedBox(height: 4),
                    LanguagePicker(
                      titleText: "I'm Learning",
                      provider: learningLanguageProvider,
                      icon: Icons.school,
                    ),
                  ],
                ),
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(error!, style: const TextStyle(color: Colors.red)),
                ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  label: const Text('Continue', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF795548),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (native != null && learning != null) {
                      context.push('/languages_selection/profile_info');
                    } else {
                      setState(() => error = "Please select both languages.");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
