import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:coding_languages/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/language_index.dart';

/// Provider for the selected index
final indexSelectedProvider = StateProvider<String?>((ref) => null);

class IndexTree extends ConsumerWidget {
  final LanguageIndex index;

  const IndexTree({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isInDrawer = context.findAncestorWidgetOfExactType<Drawer>() != null;
    var root = TreeNode<LanguageIndexNode>.root();
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TreeView.simpleTyped<LanguageIndexNode, TreeNode<LanguageIndexNode>>(
        tree: _constructTree(index.data, root),
        showRootNode: false,
        expansionBehavior: ExpansionBehavior.none,
        expansionIndicatorBuilder: (context, node) {
          if (node.isRoot) {
            return PlusMinusIndicator(
              tree: node,
              alignment: Alignment.centerLeft,
              color: Colors.grey[700],
            );
          }

          return ChevronIndicator.rightDown(
            tree: node,
            alignment: Alignment.centerLeft,
            color: Colors.grey[700],
          );
        },
        onItemTap: (value) => {
          logger.i('onItemTap: ${value.data?.name}'),
          ref.read(indexSelectedProvider.notifier).state = value.data?.name,
          if (value.data?.type == LanguageIndexType.item && isInDrawer)
            {
              Navigator.of(context).pop(),
            }
        },
        onTreeReady: (controller) {},
        indentation: const Indentation(
          thickness: 0.4,
        ),
        builder: (context, node) => Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ListTile(
            title: Text(
              node.data?.text ?? "N/A",
              style: const TextStyle(
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TreeNode<LanguageIndexNode> _constructTree(
      List<LanguageIndexNode>? nodes, TreeNode<LanguageIndexNode> currentRoot) {
    if (nodes == null) {
      return currentRoot;
    }
    for (var node in nodes) {
      var treeNode = TreeNode<LanguageIndexNode>(data: node);
      if (node.type == LanguageIndexType.category) {
        _constructTree(node.data, treeNode);
      }
      currentRoot.add(treeNode);
    }
    return currentRoot;
  }
}
