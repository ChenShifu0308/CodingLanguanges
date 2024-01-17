import 'package:coding_languages/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/main/homepage.dart';
import 'providers/setting_prodiver.dart';
import 'generated/l10n.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    var isDarkMode = ref.watch(settingModelProvider).isDarkMode;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        // theme: lightTheme(),
        // darkTheme: darkTheme(),
        title: 'Coding Languages',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          if (locale?.languageCode == 'en') {
            return const Locale('en', 'US');
          } else if (locale?.languageCode == 'zh') {
            return const Locale('zh', 'CN');
          }
          return const Locale('en', 'US');
        },
        supportedLocales: S.delegate.supportedLocales,
        home: const HomePage());
  }
}
