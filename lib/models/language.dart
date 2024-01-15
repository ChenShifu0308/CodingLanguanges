import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

/// Json Model Generation: run `dart run build_runner build --delete-conflicting-outputs`

@JsonSerializable()
class Language {
  @JsonKey(name: 'coding_language')
  final String language;
  final List<LanguageItem> data;

  Language({required this.language, required this.data});

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@JsonSerializable()
class LanguageItem {
  final String name;
  final String content;

  LanguageItem({required this.name, required this.content});

  factory LanguageItem.fromJson(Map<String, dynamic> json) =>
      _$LanguageItemFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageItemToJson(this);
}
