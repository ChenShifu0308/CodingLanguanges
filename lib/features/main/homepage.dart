import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/language_index.dart';
import '../../providers/index_provider.dart';
import '../../widgets/codes_compare_view.dart';
import '../../widgets/index_tree.dart';
import '../../widgets/split_view.dart';
import 'content_scaffold.dart';
import 'index_view.dart';

final Map<String, GlobalKey> globalIndexKeyMap = {};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      AsyncValue<LanguageIndex> index = ref.watch(indexProvider);
      if (index is AsyncData) {
        _initGlobalIndex(index.value!);
      }
      return switch (index) {
        AsyncData(:final value) => SplitView(
            breakpoint: 800,
            menu: IndexView(
              indexWidget: IndexTree(index: value),
              title: value.name,
            ),
            content: const ContentScaffold(
              body: Center(
                child: CodesCompareView(),
              ),
            ),
          ),
        AsyncLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
        _ => const CircularProgressIndicator(),
      };
    });
  }

  void _initGlobalIndex(LanguageIndex data) {
    data.getAllNodesInOrder().forEach((element) {
      _initGlobalIndexNode(element);
    });
  }

  void _initGlobalIndexNode(LanguageIndexNode node) {
    if (globalIndexKeyMap.containsKey(node.name)) {
      return;
    } else {
      globalIndexKeyMap[node.name] = GlobalKey();
    }
  }
}
