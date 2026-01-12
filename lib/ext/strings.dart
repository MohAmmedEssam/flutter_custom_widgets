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

    return splitMapJoin(
      RegExp(r'[٠-٩]'),
      onMatch: (m) => arabicToEnglish[m.group(0)] ?? '',
      onNonMatch: (nm) => nm,
    );
  }

  bool get validateEgyptPhoneNumber {
    final regex = RegExp(r'^01[0-25]\d{8}$');
    return regex.hasMatch(convertArabicToEnglishNumbers);
  }

  bool get validateArabicEnglishWithSpaces {
    final regex = RegExp(r'^[a-zA-Z\u0621-\u064A\s]+$');
    return regex.hasMatch(this);
  }

  bool get validateEmail {
    final regex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
    return regex.hasMatch(trim());
  }

  String limitChars({int maxChars = 50}) {
    return ((length > maxChars) ? '${substring(0, maxChars)}…' : this);
  }
}
