extension Strings on String {
  String get convertArabicToEnglishNumbers {
    final Map<String, String> arabicToEnglish = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    return this.splitMapJoin(
      RegExp(r'[٠-٩]'),
      onMatch: (m) => arabicToEnglish[m.group(0)] ?? '',
      onNonMatch: (nm) => nm,
    );
  }
}
