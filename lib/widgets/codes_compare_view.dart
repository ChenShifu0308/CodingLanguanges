import 'package:coding_languages/providers/setting_prodiver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/language.dart';
import '../models/language_index.dart';
import '../providers/index_provider.dart';
import '../providers/languages_provider.dart';
import 'code_view.dart';

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
    AsyncValue<LanguageIndex> index = ref.watch(indexProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Builder(builder: (context) {
          if (firstLanguageData is AsyncData &&
              (secondLanguageData == null || secondLanguageData is AsyncData) &&
              (thirdLanguageData == null || thirdLanguageData is AsyncData) &&
              (fourthLanguageData == null || fourthLanguageData is AsyncData) &&
              index is AsyncData) {
            return CodesCompareTable(
                index: index.asData!.value,
                firstLanguageData: firstLanguageData.asData!.value,
                secondLanguageData: secondLanguageData?.asData?.value,
                thirdLanguageData: thirdLanguageData?.asData?.value,
                fourthLanguageData: fourthLanguageData?.asData?.value);
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

class CodesCompareTable extends StatefulWidget {
  final Language firstLanguageData;
  final Language? secondLanguageData;
  final Language? thirdLanguageData;
  final Language? fourthLanguageData;

  final LanguageIndex index;

  const CodesCompareTable({
    super.key,
    required this.index,
    required this.firstLanguageData,
    this.secondLanguageData,
    this.thirdLanguageData,
    this.fourthLanguageData,
  });

  @override
  State<CodesCompareTable> createState() => _CodesCompareTableState();
}

class _CodesCompareTableState extends State<CodesCompareTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.index
                .getAllNodesInOrder()
                .map(
                  (e) => CodesCompareRow(
                      node: e,
                      firstLanguageData: widget.firstLanguageData,
                      secondLanguageData: widget.secondLanguageData,
                      thirdLanguageData: widget.thirdLanguageData,
                      fourthLanguageData: widget.fourthLanguageData),
                )
                .toList(),
          )),
    );
  }
}

class CodesCompareRow extends StatelessWidget {
  final LanguageIndexNode node;
  final Language firstLanguageData;
  final Language? secondLanguageData;
  final Language? thirdLanguageData;
  final Language? fourthLanguageData;

  const CodesCompareRow(
      {super.key,
      required this.node,
      required this.firstLanguageData,
      this.secondLanguageData,
      this.thirdLanguageData,
      this.fourthLanguageData});

  @override
  Widget build(BuildContext context) {
    switch (node.type) {
      case LanguageIndexType.category:
        return _buildCategoryRow(context);
      case LanguageIndexType.item:
        return _buildItemRow(context);
      default:
        return Container();
    }
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          node.text,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _buildItemRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(node.text,
                  style: Theme.of(context).textTheme.headlineSmall)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CodeView(
                code: firstLanguageData.data
                    .firstWhere((element) => element.name == node.name)
                    .content,
                codingLanguage: firstLanguageData.language,
              ),
              if (secondLanguageData != null)
                CodeView(
                  code: secondLanguageData!.data
                      .firstWhere((element) => element.name == node.name)
                      .content,
                  codingLanguage: secondLanguageData!.language,
                ),
              if (thirdLanguageData != null)
                CodeView(
                  code: thirdLanguageData!.data
                      .firstWhere((element) => element.name == node.name)
                      .content,
                  codingLanguage: thirdLanguageData!.language,
                ),
              if (fourthLanguageData != null)
                CodeView(
                  code: fourthLanguageData!.data
                      .firstWhere((element) => element.name == node.name)
                      .content,
                  codingLanguage: fourthLanguageData!.language,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
