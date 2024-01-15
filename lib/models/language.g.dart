// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      language: json['coding_language'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LanguageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'coding_language': instance.language,
      'data': instance.data,
    };

LanguageItem _$LanguageItemFromJson(Map<String, dynamic> json) => LanguageItem(
      name: json['name'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$LanguageItemToJson(LanguageItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'content': instance.content,
    };
