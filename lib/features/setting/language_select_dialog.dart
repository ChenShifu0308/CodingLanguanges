import 'dart:collection';

import 'package:coding_languages/providers/setting_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../main.dart';

/// Use 2 dropdown buttons to select 2 coding languages to compare
class LanguageSelectDialog extends ConsumerStatefulWidget {
  const LanguageSelectDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LanguageSelectDialog> createState() =>
      _LanguageSelectDialogState();
}

class _LanguageSelectDialogState extends ConsumerState<LanguageSelectDialog> {
  String? selectedCodingLanguage1;
  String? selectedCodingLanguage2;
  String? selectedCodingLanguage3;
  String? selectedCodingLanguage4;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var selectedLanguages =
          ref.watch(settingModelProvider).selectedCodingLanguages;
      setState(() {
        selectedCodingLanguage1 =
            selectedLanguages.length >= 1 ? selectedLanguages[0] : null;
        selectedCodingLanguage2 =
            selectedLanguages.length >= 2 ? selectedLanguages[1] : null;
        selectedCodingLanguage3 =
            selectedLanguages.length >= 3 ? selectedLanguages[2] : null;
        selectedCodingLanguage4 =
            selectedLanguages.length >= 4 ? selectedLanguages[3] : null;

        selectedCodingLanguage1 ??= languages.keys.first;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i('LanguageSelectDialog build');
    var isVip = ref.watch(settingModelProvider).isVip;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      title: Text(S.current.languages_selection_dialog_title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu<String>(
                initialSelection: selectedCodingLanguage1,
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
              const SizedBox(
                width: 5,
              ),
              DropdownMenu<String>(
                initialSelection: selectedCodingLanguage2,
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
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownMenu<String>(
                initialSelection: selectedCodingLanguage3,
                requestFocusOnTap: true,
                enabled: isVip,
                label: Text(S.current.third_coding_language),
                onSelected: (String? codingLanguage) {
                  setState(() {
                    selectedCodingLanguage3 = codingLanguage;
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
              const SizedBox(
                width: 5,
              ),
              DropdownMenu<String>(
                initialSelection: selectedCodingLanguage4,
                requestFocusOnTap: true,
                enabled: isVip,
                label: Text(S.current.fourth_coding_language),
                onSelected: (String? codingLanguage) {
                  setState(() {
                    selectedCodingLanguage4 = codingLanguage;
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
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(S.current.cancel),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(S.current.confirm),
          onPressed: () {
            if (_haveSameCodingLanguage(
                selectedCodingLanguage1,
                selectedCodingLanguage2,
                selectedCodingLanguage3,
                selectedCodingLanguage4)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please select different coding languages'),
                ),
              );
              return;
            } else {
              var selectedLanguages = <String>[];
              if (selectedCodingLanguage1 != null) {
                selectedLanguages.add(selectedCodingLanguage1!);
              }
              if (selectedCodingLanguage2 != null) {
                selectedLanguages.add(selectedCodingLanguage2!);
              }
              if (selectedCodingLanguage3 != null) {
                selectedLanguages.add(selectedCodingLanguage3!);
              }
              if (selectedCodingLanguage4 != null) {
                selectedLanguages.add(selectedCodingLanguage4!);
              }
              ref
                  .read(settingModelProvider.notifier)
                  .setCodingLanguages(selectedLanguages);
            }
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  /// This is ugly, make it more generic later.
  bool _haveSameCodingLanguage(
      String? selectedCodingLanguage1,
      String? selectedCodingLanguage2,
      String? selectedCodingLanguage3,
      String? selectedCodingLanguage4) {
    var set = HashSet<String>();
    if (selectedCodingLanguage1 != null) {
      set.add(selectedCodingLanguage1);
    }
    if (selectedCodingLanguage2 != null) {
      if (set.contains(selectedCodingLanguage2)) {
        return true;
      }
      set.add(selectedCodingLanguage2);
    }
    if (selectedCodingLanguage3 != null) {
      if (set.contains(selectedCodingLanguage3)) {
        return true;
      }
      set.add(selectedCodingLanguage3);
    }
    if (selectedCodingLanguage4 != null) {
      if (set.contains(selectedCodingLanguage4)) {
        return true;
      }
      set.add(selectedCodingLanguage4);
    }

    return false;
  }
}
