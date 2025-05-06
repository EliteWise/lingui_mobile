import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lingui_mobile/common_widgets/navigation.dart';
import 'package:lingui_mobile/features/community/presentation/profile_page.dart';
import 'package:lingui_mobile/features/onboarding/presentation/languages_selection_page.dart';
import 'package:lingui_mobile/features/onboarding/presentation/profile_info_page.dart';
import 'package:lingui_mobile/features/settings/presentation/legal_privacy_page.dart';
import 'package:lingui_mobile/features/settings/presentation/settings_page.dart';
import 'package:lingui_mobile/features/settings/presentation/support_help_page.dart';

import 'features/auth/presentation/login_page.dart';
import 'features/community/data/profile.dart';

final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(path: '/', builder: (_,__) => const LoginPage()),
      GoRoute(path: '/languages_selection', pageBuilder: (_, __) => CustomTransitionPage(child: const LanguagesSelectionPage(),
              transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child)),
      routes: [
        GoRoute(path: 'profile_info', builder: (_, __) => const ProfileInfoPage()),
      ]),
      GoRoute(path: '/navigation', builder: (_, __) => const Navigation(),
      routes: [
        GoRoute(path: 'profile_page', builder: (_, state) => ProfilePage(profile: state.extra as Profile))
      ]),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsPage(),
      routes: [
        GoRoute(path: 'legal_privacy', builder: (_, __) => const LegalPrivacyPage()),
        GoRoute(path: 'support_help', builder: (_, __) => const SupportHelpPage())
      ]),
    ],
  errorBuilder: (context, state) => const Scaffold(
    body: Center(
      child: Text('Page not found'),
    ),
  )
);