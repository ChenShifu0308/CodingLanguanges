import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../main.dart';

/// Use 2 dropdown buttons to select 2 coding languages to compare
class LanguageSelectDialog extends ConsumerStatefulWidget {
  const LanguageSelectDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<LanguageSelectDialog> createState() =>
      _LanguageSelectDialogState();
}

class _LanguageSelectDialogState extends ConsumerState<LanguageSelectDialog> {
  String? selectedCodingLanguage1;
  String? selectedCodingLanguage2;

  @override
  Widget build(BuildContext context) {
    logger.i('LanguageSelectDialog build');
    return Material(
      child: Column(
        children: [
          DropdownMenu<String>(
            initialSelection: languages.keys.first,
            requestFocusOnTap: true,
            label: Text(S.current.first_coding_language),
            onSelected: (String? codingLanguage) {
              setState(() {
                selectedCodingLanguage1 = codingLanguage;
              });
            },
            dropdownMenuEntries: languages.keys
                .map<DropdownMenuEntry<String>>((String codingLanguage) {
              return DropdownMenuEntry<String>(
                value: codingLanguage,
                label: codingLanguage,
              );
            }).toList(),
          ),
          SizedBox(
            height: 20,
          ),
          DropdownMenu<String>(
            initialSelection: languages.keys.first,
            requestFocusOnTap: true,
            label: Text(S.current.second_coding_language),
            onSelected: (String? codingLanguage) {
              setState(() {
                selectedCodingLanguage2 = codingLanguage;
              });
            },
            dropdownMenuEntries: languages.keys
                .map<DropdownMenuEntry<String>>((String codingLanguage) {
              return DropdownMenuEntry<String>(
                value: codingLanguage,
                label: codingLanguage,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
