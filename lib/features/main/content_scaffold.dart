import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../utils/coloors.dart';
import '../../widgets/custom_icon_button.dart';
import '../setting/language_select_dialog.dart';
import '../setting/setting_dialog.dart';

class ContentScaffold extends StatelessWidget {
  const ContentScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    // 1. look for an ancestor Scaffold
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      appBar: AppBar(
        leading: hasDrawer
            ? IconButton(
                icon: const Icon(Icons.menu),
                // 4. open the drawer if we have one
                onPressed:
                    hasDrawer ? () => ancestorScaffold!.openDrawer() : null,
              )
            : null,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Coloors.greyLight,
            height: 0.5,
          ),
        ),
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
                  builder: (context) {
                    return const LanguageSelectDialog();
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
      body: body,
    );
  }
}
