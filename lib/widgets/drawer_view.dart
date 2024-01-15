import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:coding_languages/main.dart';
import 'package:flutter/material.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return TreeView.simpleTyped<Explorable, TreeNode<Explorable>>(
      tree: tree,
      showRootNode: true,
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
      onItemTap: (value) => {logger.i('onItemTap: ${value.data?.name}')},
      onTreeReady: (controller) {
        /* 测试自动展开 */
        // controller.expandNode(tree);
        // var media = tree.childrenAsList[1] as TreeNode<Explorable>;
        // Future.delayed(Duration(milliseconds: 20), () {
        //   controller.expandNode(media);
        //   var picture = media.childrenAsList[0] as TreeNode<Explorable>;
        //   Future.delayed(Duration(milliseconds: 20), () {
        //     controller.expandNode(picture);
        //     Future.delayed(Duration(milliseconds: 20), () {
        //       controller.scrollToItem(
        //           picture.childrenAsList[12] as TreeNode<Explorable>);
        //     });
        //   });
        // });
      },
      indentation: const Indentation(),
      builder: (context, node) => Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ListTile(
          title: Text(
            node.data?.name ?? "N/A",
            style: const TextStyle(
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}

abstract class Explorable {
  final String name;
  final DateTime createdAt;

  Explorable(this.name) : this.createdAt = DateTime.now();

  @override
  String toString() => name;
}

class File extends Explorable {
  final String mimeType;

  File(super.name, {required this.mimeType});
}

class Folder extends Explorable {
  Folder(super.name);
}

typedef ExplorableNode = TreeNode<Explorable>;

typedef FileNode = TreeNode<File>;

typedef FolderNode = TreeNode<Folder>;

final tree = TreeNode<Explorable>.root(data: Folder("Index"))
  ..addAll([
    FolderNode(data: Folder("Basic"))
      ..addAll([
        FileNode(
          data: File("Variable Declaration", mimeType: "application/msword"),
        ),
        FileNode(
          data:
              File("Read Only Variables", mimeType: "application/vnd.ms-excel"),
        ),
        FileNode(
          data: File("Variable Assignment",
              mimeType: "application/vnd.ms-powerpoint"),
        )
      ]),
    FolderNode(data: Folder("Operators"))
      ..addAll([
        FolderNode(data: Folder("Pictures"))
          ..addAll([
            FileNode(data: File("birthday_1.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_2.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_3.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_4.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_5.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_6.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_7.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_8.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("birthday_9.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_1.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_2.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_3.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_4.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_5.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_6.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("lunch_7.jpg", mimeType: "image/jpeg")),
            FileNode(data: File("banner.png", mimeType: "image/png")),
          ]),
        FolderNode(data: Folder("Videos"))
          ..addAll([
            FolderNode(data: Folder("Birthday_23"))
              ..addAll([
                FileNode(
                    data: File("birthday_23_1.mp4", mimeType: "video/mp4")),
                FileNode(
                    data: File("birthday_23_2.mp4", mimeType: "video/mp4")),
              ]),
            FolderNode(data: Folder("vacation_ibiza"))
              ..addAll([
                FileNode(data: File("snorkeling.mp4", mimeType: "video/mp4")),
                FileNode(data: File("scuba.mp4", mimeType: "video/mp4")),
              ])
          ])
      ]),
    FolderNode(data: Folder("Comments"))
      ..addAll([
        FolderNode(data: Folder("temp")),
        FolderNode(data: Folder("apps"))
          ..addAll([
            FileNode(
              data: File("word.exe", mimeType: "application/win32_exe"),
            ),
            FileNode(
              data: File("powerpoint.exe", mimeType: "application/win32_exe"),
            ),
            FileNode(
              data: File("excel.exe", mimeType: "application/win32_exe"),
            ),
          ]),
        FileNode(
          data: File("sys.exe", mimeType: "application/win32_exe"),
        ),
        FileNode(
          data: File("config.exe", mimeType: "application/win32_exe"),
        )
      ]),
  ]);
