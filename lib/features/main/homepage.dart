import 'package:coding_languages/utils/asset_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/language_index.dart';
import '../../providers/index_provider.dart';
import '../../widgets/codes_compare_view.dart';
import '../../widgets/index_tree.dart';
import '../../widgets/split_view.dart';
import '../../widgets/test/twod_scroll_test_view.dart';
import 'content_scaffold.dart';
import 'index_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      AsyncValue<LanguageIndex> index = ref.watch(indexProvider);
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
}
