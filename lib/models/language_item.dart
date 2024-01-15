enum IndexType {
  category, // It is a category folder
  item; // It is a language leaf item
}

class LanguageItem {
  final String name;
  final String code;
  final IndexType type;

  LanguageItem({
    required this.name,
    required this.code,
    required this.type,
  });

  factory LanguageItem.fromJson(Map<String, dynamic> json) {
    return LanguageItem(
      name: json['name'],
      code: json['code'],
      type: json['type'] == 'category' ? IndexType.category : IndexType.item,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'type': type == IndexType.category ? 'category' : 'leaf',
    };
  }
}
