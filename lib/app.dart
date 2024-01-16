import 'package:coding_languages/features/setting/language_select_dialog.dart';
import 'package:coding_languages/features/setting/setting_dialog.dart';
import 'package:coding_languages/theme/dark_theme.dart';
import 'package:coding_languages/theme/light_theme.dart';
import 'package:coding_languages/widgets/custom_icon_button.dart';
import 'package:coding_languages/widgets/demo/data_table_view.dart';
import 'package:coding_languages/widgets/index_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/main/homepage.dart';
import 'generated/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
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
