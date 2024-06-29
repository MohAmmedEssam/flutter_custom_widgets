import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class Localize extends Translations {
  final Map<String, Map<String, String>> _keys = {};

  @override
  Map<String, Map<String, String>> get keys => _keys;
  Future<void> loadJsonTranslations() async {
    await _loadTranslations();
  }

  Future<void> _loadTranslations() async {
    try {
      List<String> supportedLanguages = ['ar', 'en'];
      for (String language in supportedLanguages) {
        String jsonString =
            await rootBundle.loadString('assets/translations/$language.json');
        Map<String, dynamic> jsonMap = json.decode(jsonString);
        _keys[language] = jsonMap.cast<String, String>();
      }
      // ignore: empty_catches
    } catch (error) {}
  }
}
