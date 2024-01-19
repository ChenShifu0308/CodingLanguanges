import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/setting_prodiver.dart';

class CodeView extends ConsumerWidget {
  final String code;
  final String codingLanguage;

  const CodeView({super.key, required this.code, required this.codingLanguage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var fontSize = ref.watch(settingModelProvider).codeFontSize;
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              codingLanguage,
              style: TextStyle(
                fontSize: fontSize * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            width: fontSize * 23,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withAlpha(200),
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                color: Color(0xFFF8F8F8),
                padding: const EdgeInsets.all(18.0),
                child: HighlightView(
                  code,
                  language: codingLanguage,
                  theme: githubTheme,
                  padding: const EdgeInsets.all(4),
                  textStyle: TextStyle(
                    fontFamily: 'Roboto Mono',
                    fontSize: fontSize.roundToDouble(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
