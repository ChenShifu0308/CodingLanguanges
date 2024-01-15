import 'package:coding_languages/utils/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

@immutable
class SettingModel {
  final bool isDarkMode;
  final int codeFontSize;
  final String language; // 'en' 'zh'
  final List<String> codingLanguages;

  const SettingModel({
    required this.isDarkMode,
    required this.codeFontSize,
    required this.language,
    required this.codingLanguages,
  });

  SettingModel.fromSharedPref(SharedPreferences? pref)
      : isDarkMode = pref?.getBool('isDarkMode') ?? false,
        codeFontSize = pref?.getInt('codeFontSize') ?? 12,
        language = pref?.getString('language') ?? 'en',
        codingLanguages = pref?.getStringList('codingLanguages') ?? ['dart'];

  SettingModel copyWith({
    bool? isDarkMode,
    int? codeFontSize,
    String? language,
    List<String>? codingLanguages,
  }) {
    return SettingModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      codeFontSize: codeFontSize ?? this.codeFontSize,
      language: language ?? this.language,
      codingLanguages: codingLanguages ?? this.codingLanguages,
    );
  }

  SettingModel fromSharedPref({
    SharedPreferences? pref,
  }) {
    return SettingModel(
      isDarkMode: pref?.getBool('isDarkMode') ?? false,
      codeFontSize: pref?.getInt('codeFontSize') ?? 12,
      language: pref?.getString('language') ?? 'en',
      codingLanguages: pref?.getStringList('codingLanguages') ?? ['dart'],
    );
  }
}

final settingModelProvider =
    StateNotifierProvider<SettingModelNotifier, SettingModel>((ref) {
  final pref = ref.watch(sharedPrefs).maybeWhen(
        data: (value) => value,
        orElse: () => null,
      );
  return SettingModelNotifier(pref);
});

class SettingModelNotifier extends StateNotifier<SettingModel> {
  final SharedPreferences? pref;

  SettingModelNotifier(this.pref) : super(SettingModel.fromSharedPref(pref));

  void setDarkMode(bool isDarkMode) {
    pref?.setBool('isDarkMode', isDarkMode);
    state = state.copyWith(isDarkMode: isDarkMode);
  }

  void setCodeFontSize(int codeFontSize) {
    pref?.setInt('codeFontSize', codeFontSize);
    state = state.copyWith(codeFontSize: codeFontSize);
  }

  void setLanguage(String language) {
    pref?.setString('language', language);
    state = state.copyWith(language: language);
  }

  void setCodingLanguages(List<String> codingLanguages) {
    pref?.setStringList('codingLanguages', codingLanguages);
    state = state.copyWith(codingLanguages: codingLanguages);
  }
}
