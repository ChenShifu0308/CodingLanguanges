import 'package:coding_languages/providers/shared_pref_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingModelProvider =
    StateNotifierProvider<SettingModelNotifier, SettingModel>((ref) {
  final pref = ref.watch(sharedPrefsProvider).maybeWhen(
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

  void setIsVip(bool isVip) {
    pref?.setBool('isVip', isVip);
    state = state.copyWith(isVip: isVip);
  }

  void toggleVip() {
    pref?.setBool('isVip', !state.isVip);
    state = state.copyWith(isVip: !state.isVip);
  }

  void toggleDarkMode() {
    pref?.setBool('isDarkMode', !state.isDarkMode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}

@immutable
class SettingModel {
  final bool isDarkMode;
  final int codeFontSize;
  final String language; // 'en' 'zh'
  final List<String> selectedCodingLanguages;

  final bool isVip;

  const SettingModel({
    required this.isDarkMode,
    required this.codeFontSize,
    required this.language,
    required this.selectedCodingLanguages,
    required this.isVip,
  });

  SettingModel.fromSharedPref(SharedPreferences? pref)
      : isDarkMode = pref?.getBool('isDarkMode') ?? false,
        codeFontSize = pref?.getInt('codeFontSize') ?? 12,
        language = pref?.getString('language') ?? 'en',
        selectedCodingLanguages =
            pref?.getStringList('codingLanguages') ?? ['dart'],
        isVip = pref?.getBool('isVip') ?? false;

  SettingModel copyWith({
    bool? isDarkMode,
    int? codeFontSize,
    String? language,
    List<String>? codingLanguages,
    bool? isVip,
  }) {
    return SettingModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      codeFontSize: codeFontSize ?? this.codeFontSize,
      language: language ?? this.language,
      selectedCodingLanguages: codingLanguages ?? this.selectedCodingLanguages,
      isVip: isVip ?? this.isVip,
    );
  }

  SettingModel fromSharedPref({
    SharedPreferences? pref,
  }) {
    return SettingModel(
      isDarkMode: pref?.getBool('isDarkMode') ?? false,
      codeFontSize: pref?.getInt('codeFontSize') ?? 12,
      language: pref?.getString('language') ?? 'en',
      selectedCodingLanguages:
          pref?.getStringList('codingLanguages') ?? ['dart'],
      isVip: pref?.getBool('isVip') ?? false,
    );
  }
}
