import 'package:coding_languages/widgets/demo/code_view.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

/* https://pub.dev/packages/data_table_2 */
class DataTableViewDemo extends StatefulWidget {
  const DataTableViewDemo({super.key});

  @override
  State<DataTableViewDemo> createState() => _DataTableViewDemoState();
}

class _DataTableViewDemoState extends State<DataTableViewDemo> {
  ScrollController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DataTable2(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
          headingRowHeight: 30,
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          /* 设置成可配置的 */
          columns: [
            DataColumn2(
              size: ColumnSize.S,
              label: Center(child: Text('Java')),
            ),
            DataColumn2(
              size: ColumnSize.S,
              label: Center(child: Text('Kotlin')),
            ),
            DataColumn2(
              size: ColumnSize.S,
              label: Center(child: Text('Swift')),
            ),
          ],
          rows: List<DataRow>.generate(
              100,
              (index) => DataRow2(
                    specificRowHeight: 140, // 针对不同的行，计算生成不同的高度
                    cells: [
                      DataCell(
                        CodeView(),
                      ),
                      DataCell(
                        CodeView(),
                      ),
                      DataCell(
                        CodeView(),
                      ),
                    ],
                  ))),
    );
  }
}
