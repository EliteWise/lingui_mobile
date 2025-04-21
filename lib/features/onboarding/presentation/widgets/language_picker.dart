import 'package:flutter/material.dart';
import 'package:custom_language_picker/custom_language_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguagePicker extends ConsumerWidget {
  final String? titleText;
  final StateProvider<Language?> provider;
  final IconData icon;

  const LanguagePicker({
    super.key,
    required this.titleText,
    required this.provider,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(provider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFFFFA000)),
            const SizedBox(width: 12),
            Text(
              titleText ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => CustomLanguagePickerDialog(
                    headerBackgroundColor: const Color(0xFFFFE082),
                    headerTextColor: const Color(0xFF795548),
                    searchBorderColor: Colors.transparent,
                    searchFocusedBorderColor: Colors.transparent,
                    searchIconColor: Color(0xFFFFA000),
                    titleText: titleText,
                    isSearchable: true,
                    showNativeNames: true,
                    onValuePicked: (Language language) {
                      ref.read(provider.notifier).state = language;
                    },
                    itemBuilder: (language, {isFavorite, onFavoriteToggle}) => ListTile(
                      leading: Text(language.flagEmoji),
                      title: Text(language.name),
                      subtitle: Text(language.nativeName),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      selectedLanguage != null
                          ? "${selectedLanguage.flagEmoji} ${selectedLanguage.name}"
                          : "Select your language",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: selectedLanguage == null ? Colors.black54 : Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_drop_down,
                      color: selectedLanguage == null ? Colors.black54 : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
