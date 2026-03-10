import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custom_language_picker/custom_language_picker.dart';

class LanguageNotifier extends Notifier<Language?> {
  @override
  Language? build() => null;

  void set(Language language) {
    state = language;
  }
}

final nativeLanguageProvider = NotifierProvider<LanguageNotifier, Language?>(
  LanguageNotifier.new,
);

final learningLanguageProvider = NotifierProvider<LanguageNotifier, Language?>(
  LanguageNotifier.new,
);
