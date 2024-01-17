import 'package:coding_languages/providers/setting_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
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
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Text(S.current.setting_dialog_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // VIP 测试
          SwitchListTile(
            title: Text(S.current.setting_dialog_vip_title),
            subtitle: Text(S.current.setting_dialog_vip_subtitle),
            value: ref.watch(settingModelProvider).isVip,
            onChanged: (value) {
              ref.read(settingModelProvider.notifier).toggleVip();
            },
          ),
          // Dark Mode
          SwitchListTile(
            title: Text(S.current.setting_dialog_dark_mode_title),
            subtitle: Text(S.current.setting_dialog_dark_mode_subtitle),
            value: ref.watch(settingModelProvider).isDarkMode,
            onChanged: (value) {
              ref.read(settingModelProvider.notifier).toggleDarkMode();
              // 设置app为暗黑模式
            },
          ),
          // 使用DropdownMenu 设置App语言
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.setting_dialog_language_title,
                  style: const TextStyle(fontSize: 16),
                ),
                DropdownButton<String>(
                  value: ref.watch(settingModelProvider).language,
                  onChanged: (String? newValue) {
                    ref
                        .read(settingModelProvider.notifier)
                        .setLanguage(newValue!);
                  },
                  items: S.delegate.supportedLocales.map((locale) {
                    return DropdownMenuItem<String>(
                      value: locale.languageCode,
                      child: Text(locale.languageCode),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // 使用Slider 设置代码字体大小
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.current.setting_dialog_code_font_size_title,
                  style: const TextStyle(fontSize: 16),
                ),
                Slider(
                  value:
                      ref.watch(settingModelProvider).codeFontSize.toDouble(),
                  min: 8,
                  max: 30,
                  divisions: 22,
                  label:
                      ref.watch(settingModelProvider).codeFontSize.toString(),
                  onChanged: (double value) {
                    ref
                        .read(settingModelProvider.notifier)
                        .setCodeFontSize(value.toInt());
                  },
                ),
                Text(
                  ref.watch(settingModelProvider).codeFontSize.toString(),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
