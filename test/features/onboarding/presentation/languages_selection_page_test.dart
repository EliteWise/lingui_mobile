import 'package:custom_language_picker/custom_language_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lingui_mobile/features/onboarding/presentation/languages_selection_page.dart';
import 'package:lingui_mobile/features/onboarding/presentation/states/language_provider.dart';

void main() {
  testWidgets("Should display errors if no selection", (tester) async {
    final navKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          nativeLanguageProvider.overrideWith((ref) => null),
          learningLanguageProvider.overrideWith((ref) => null),
        ],
        child: MaterialApp(
          navigatorKey: navKey,
          home: LanguagesSelectionPage(
            onNext: () {},
          )
        ),
      )
    );

    await tester.tap(find.text("Continue"));
    await tester.pump();

    expect(find.text("Please select both languages."), findsOneWidget);
  });

  testWidgets("Should select native and learning languages and continue to next page", (tester) async {
    final navKey = GlobalKey<NavigatorState>();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          nativeLanguageProvider.overrideWith((ref) => Language(code: LanguageCode.aa, name: "French", nativeName: "French", flagEmoji: "fr")),
          learningLanguageProvider.overrideWith((ref) => Language(code: LanguageCode.aa, name: "English", nativeName: "French", flagEmoji: "en")),
        ],
        child: MaterialApp(
          navigatorKey: navKey,
          home: LanguagesSelectionPage(
            onNext: () {
              navKey.currentState?.push(MaterialPageRoute(
                builder: (_) => const Scaffold(body: Text('Next Page')),
              ));
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text("Next Page"), findsOneWidget);
  });
}