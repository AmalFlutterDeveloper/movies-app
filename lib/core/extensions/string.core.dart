extension StringExtension on String {
  
  /// parse string to date time
  DateTime? toLocalDateTime(Map<String, dynamic> map) {
    if (map[this] is String) return DateTime.parse(map[this]).toLocal();
    if (map[this] is num) {
      return DateTime.fromMillisecondsSinceEpoch(map[this]).toLocal();
    }
    return null;
  }

  /// getting asset image path => 'assets/images/??'
  String get image => 'assets/images/$this';

  String get toFlag {
    // 0x41 is Letter A => 65
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    final int first = codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int second = codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(first) + String.fromCharCode(second);
  }
}



