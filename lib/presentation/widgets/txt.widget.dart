import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/space.core.dart';

class Txt extends StatelessWidget {
  final Color? color;
  final double? size;
  final int? weight;
  final String? s;
  final bool lineThrough;
  final String? quickColor;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final List? args;
  final bool _translate;

  const Txt.t(
    this.s, {
    super.key,
    this.color,
    this.size = 14,
    this.weight = 500,
    this.lineThrough = false,
    this.quickColor,
    this.textAlign,
    this.style,
    this.maxLines,
    this.args,
  }) : _translate = true;

  const Txt(
    this.s, {
    super.key,
    this.color,
    this.size = 14,
    this.weight = 500,
    this.lineThrough = false,
    this.quickColor,
    this.textAlign,
    this.style,
    this.maxLines,
  })  : _translate = false,
        args = null;

  static const _weights = {
    400: FontWeight.w400,
    500: FontWeight.w500,
    600: FontWeight.w600,
    700: FontWeight.w700,
    800: FontWeight.w800,
  };

  /// returning text if it's translated or not
  String get _text {
    if (!_translate) return s!;
    return tr(s!, args: args?.map((e) => e.toString()).toList());
  }

  Color? get _color {
    if (color != null) return color;
    if (quickColor != null) {
      return Color(
          int.parse(quickColor!.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // if (_weights[weight] == null) {
    //   throw Exception(tr(keys.errorToastMessage_unSupportedWeight,
    //       args: [weight.toString()]));
    // }
    if (s == null) return empty;
    return Text(
      _text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: style ??
          TextStyle(
            fontSize: size,
            color: _color,
            fontWeight: _weights[weight],
            decoration:
                lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
          ),
    );
  }
}
