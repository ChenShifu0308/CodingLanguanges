import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class SettingDialog extends ConsumerStatefulWidget {
  const SettingDialog({super.key});

  @override
  ConsumerState<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends ConsumerState<SettingDialog> {
  @override
  Widget build(BuildContext context) {
    logger.i('SettingDialog build');
    return Container(
      // 设置dialog的内容
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            '这是一个自定义的Dialog',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              // 点击按钮关闭dialog
              Navigator.of(context).pop();
            },
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}
