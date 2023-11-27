import 'package:coding_languages/setting/setting_dialog.dart';
import 'package:coding_languages/theme/dark_theme.dart';
import 'package:coding_languages/theme/light_theme.dart';
import 'package:coding_languages/widgets/custom_icon_button.dart';
import 'package:coding_languages/widgets/demo/data_table_view.dart';
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
            icon: Icons.settings,
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Index',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          /* We would better to have a collapsing list*/
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Basic'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Types'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Control flow'),
          ),
        ],
      )),
      body: const DataTableViewDemo(),
    );
  }
}
