import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/language.dart';
import '../utils/asset_util.dart';

/// Provides all the languages supported by the app.
final List<String> allLanguages = [
  'Kotlin',
  'TypeScript',
  'Swift',
  'Python',
  'Java',
  'JavaScript',
  'Dart',
  'Go',
];

/// Provides the languages data
final languagesDataProvider =
    FutureProvider.family<Language, String>((ref, language) async {
  final content = AssetUtil.loadJsonFromAssets('languages/$language.json')
      .then((value) => Language.fromJson(value));
  return content;
});
