import 'package:coding_languages/utils/asset_util.dart';
import 'package:flutter/material.dart';

import '../../models/language_index.dart';
import '../../widgets/index_tree.dart';
import '../../widgets/split_view.dart';
import 'content_scaffold.dart';
import 'index_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AssetUtil.loadJsonFromAssets('json/index.json')
          .then((value) => LanguageIndex.fromJson(value)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var index = snapshot.data as LanguageIndex;
          return SplitView(
            menu: IndexView(
              indexWidget: IndexTree(index: index),
              title: index.name,
            ),
            content: const ContentScaffold(
              body: Center(
                child: Text('Content'),
              ), //DataTableViewDemo(),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
