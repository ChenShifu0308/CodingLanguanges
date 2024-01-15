import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../utils/coloors.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/demo/data_table_view.dart';
import '../../widgets/drawer_view.dart';
import '../setting/language_select_dialog.dart';
import '../setting/setting_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Coloors.greyLight,
            height: 0.5,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          S.current.app_name,
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: '',
                  builder: (context) {
                    return Container(
                      width: 300,
                      height: 300,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const LanguageSelectDialog(),
                    );
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
                showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: '',
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Container(
                        width: 300,
                        height: 400,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const SettingDialog(),
                      );
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
