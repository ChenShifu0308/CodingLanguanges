import 'package:coding_languages/providers/setting_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/languages_provider.dart';

class CodesCompareView extends ConsumerStatefulWidget {
  const CodesCompareView({super.key});

  @override
  ConsumerState<CodesCompareView> createState() => _CodesCompareViewState();
}

class _CodesCompareViewState extends ConsumerState<CodesCompareView> {
  static final List<GlobalKey> _key = List.generate(50, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var selectedCodingLanguages =
        ref.watch(settingModelProvider).selectedCodingLanguages;
    var firstLanguage = selectedCodingLanguages.length >= 1
        ? selectedCodingLanguages[0]
        : allLanguages.first;
    var secondLanguage =
        selectedCodingLanguages.length >= 2 ? selectedCodingLanguages[1] : null;
    var thirdLanguage =
        selectedCodingLanguages.length >= 3 ? selectedCodingLanguages[2] : null;
    var fourthLanguage =
        selectedCodingLanguages.length >= 4 ? selectedCodingLanguages[3] : null;

    var firstLanguageData = ref.watch(languagesDataProvider(firstLanguage));
    var secondLanguageData = secondLanguage != null
        ? ref.watch(languagesDataProvider(secondLanguage))
        : null;
    var thirdLanguageData = thirdLanguage != null
        ? ref.watch(languagesDataProvider(thirdLanguage))
        : null;
    var fourthLanguageData = fourthLanguage != null
        ? ref.watch(languagesDataProvider(fourthLanguage))
        : null;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Builder(builder: (context) {
          if (firstLanguageData is AsyncData &&
              (secondLanguageData == null || secondLanguageData is AsyncData) &&
              (thirdLanguageData == null || thirdLanguageData is AsyncData) &&
              (fourthLanguageData == null || fourthLanguageData is AsyncData)) {
            return const Text('Loaded');
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
