import 'package:json_annotation/json_annotation.dart';

part 'language_index.g.dart';

/// The language index model
/// Json Model Generation: run `dart run build_runner build --delete-conflicting-outputs`
@JsonSerializable()
class LanguageIndex {
  final String name;
  final String language; // 'zh' or 'en';
  final List<LanguageIndexNode> data;

  LanguageIndex(
      {required this.name, required this.language, required this.data});

  factory LanguageIndex.fromJson(Map<String, dynamic> json) =>
      _$LanguageIndexFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageIndexToJson(this);

  List<LanguageIndexNode> getAllNodesInOrder() {
    List<LanguageIndexNode> result = [];
    for (var item in data) {
      if (item.type == LanguageIndexType.category) {
        result.addAll(item.getAllNodesInOrder());
      } else {
        result.add(item);
      }
    }
    return result;
  }
}

@JsonSerializable()
class LanguageIndexNode {
  // For a item type, name is the key of the item in the language model
  final String name;
  final String text;
  final LanguageIndexType type;
  final List<LanguageIndexNode>? data;

  LanguageIndexNode(
      {required this.name, required this.text, required this.type, this.data});

  factory LanguageIndexNode.fromJson(Map<String, dynamic> json) =>
      _$LanguageIndexNodeFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageIndexNodeToJson(this);

  List<LanguageIndexNode> getAllNodesInOrder() {
    List<LanguageIndexNode> result = [this];
    if (data == null) return result;
    for (var item in data!) {
      if (item.type == LanguageIndexType.category) {
        result.addAll(item.getAllNodesInOrder());
      } else {
        result.add(item);
      }
    }
    return result;
  }
}

enum LanguageIndexType {
  @JsonValue('category')
  category,
  @JsonValue('item')
  item,
}
