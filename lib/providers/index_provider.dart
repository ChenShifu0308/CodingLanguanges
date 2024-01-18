import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/language_index.dart';
import '../utils/asset_util.dart';

/// Provides the languages data
final indexProvider = FutureProvider<LanguageIndex>((ref) async {
  final content = AssetUtil.loadJsonFromAssets('json/index_en.json')
      .then((value) => LanguageIndex.fromJson(value));
  return content;
});
