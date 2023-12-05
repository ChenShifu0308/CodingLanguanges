import 'package:coding_languages/setting/setting_dialog.dart';
import 'package:coding_languages/theme/dark_theme.dart';
import 'package:coding_languages/theme/light_theme.dart';
import 'package:coding_languages/widgets/custom_icon_button.dart';
import 'package:coding_languages/widgets/demo/data_table_view.dart';
import 'package:coding_languages/widgets/drawer_view.dart';
import 'package:flutter/material.dart';

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
        home: const HomePage());
  }
}

/* Extract a single widget because we need the material context to showDialog. */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          'Coding Languages',
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const SettingDialog();
                  });
            },
            icon: Icons.view_column,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 10,
            ),
            child: CustomIconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const SettingDialog();
                    });
              },
              icon: Icons.settings,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        width: 300, // 计算显示宽度，然后比显示宽度小一些。
        elevation: 50,
        backgroundColor: Colors.white,
        child: IndexView(),
      ),
      body: const DataTableViewDemo(),
    );
  }
}
