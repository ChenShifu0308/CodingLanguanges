import 'package:flutter/material.dart';

import '../../widgets/demo/data_table_view.dart';
import '../../widgets/drawer_view.dart';
import '../../widgets/split_view.dart';
import 'content_scaffold.dart';
import 'index_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SplitView(
      menu: IndexView(
        indexWidget: IndexTestView(),
      ),
      content: ContentScaffold(
        body: Center(
          child: Text('Content'),
        ), //DataTableViewDemo(),
      ),
    );
  }
}
