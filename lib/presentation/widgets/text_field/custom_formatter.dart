import 'package:flutter/services.dart';

class CustomFormatter extends TextInputFormatter {
  final String format;
  final String allow;
  final String _format;
  final Iterable<String> _specials;
  late final int _length;
  final List<String> _nonHash;
  CustomFormatter({
    required this.format,
    this.allow = '.',
  })  : _specials = format.split('#')
          ..removeWhere((element) => element.isEmpty),
        _format = format
            .split('')
            .map((e) => (e != '#') ? '_' : '#')
            .join()
            .replaceAll(RegExp('_+'), '_'),
        _nonHash = format.replaceAll('#', '').split('') {
    _length = _format.split('').where((e) => e == '#').length;
  }

  final _specialRegex = [
    '.',
    '+',
    '*',
    '(',
    ')',
    '-',
  ];

  String get deny {
    return '[${_nonHash.map((e) => _specialRegex.contains(e) ? '\\$e' : e).join()}]';
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.selection.baseOffset == 0) return newValue;
    final buffer = StringBuffer();
    var text = newValue.text;
    String f;
    int index = 0;
    int special = 0;
    for (var i = 0; i < text.length; i++) {
      if (i >= _length) break;
      f = _format[index++];
      if (f != '#') {
        buffer.write(_specials.elementAt(special++));
        index++;
      }
      buffer.write(text[i]);
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.length,
      ),
    );
  }
}
