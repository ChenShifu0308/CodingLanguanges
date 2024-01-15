// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageIndex _$LanguageIndexFromJson(Map<String, dynamic> json) =>
    LanguageIndex(
      name: json['name'] as String,
      language: json['language'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => LanguageIndexNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageIndexToJson(LanguageIndex instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'data': instance.data,
    };

LanguageIndexNode _$LanguageIndexNodeFromJson(Map<String, dynamic> json) =>
    LanguageIndexNode(
      name: json['name'] as String,
      text: json['text'] as String,
      type: $enumDecode(_$LanguageIndexTypeEnumMap, json['type']),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LanguageIndexNode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LanguageIndexNodeToJson(LanguageIndexNode instance) =>
    <String, dynamic>{
      'name': instance.name,
      'text': instance.text,
      'type': _$LanguageIndexTypeEnumMap[instance.type]!,
      'data': instance.data,
    };

const _$LanguageIndexTypeEnumMap = {
  LanguageIndexType.category: 'category',
  LanguageIndexType.item: 'item',
};
