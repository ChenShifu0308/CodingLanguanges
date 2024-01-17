import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';


/* https://pub.dev/packages/flutter_highlight */
class CodeView extends StatelessWidget {
  const CodeView({super.key});
  static const String dartCode = """
// Run the app like this: dart args.dart 1 test
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}
""";
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withAlpha(200),
            width: 4,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: HighlightView(
            dartCode,
            language: 'dart',
            theme: githubTheme,
            padding: const EdgeInsets.all(4),
            textStyle: const TextStyle(
              fontFamily: 'Roboto Mono',
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
