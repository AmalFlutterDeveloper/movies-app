// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/radius.core.dart';

class CustomContainer extends StatelessWidget {
  final BorderRadius circular;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? width;
  final bool hasBorder;

  const CustomContainer({
    Key? key,
    this.circular = circular12,
    required this.child,
    this.margin,
    this.padding,
    this.color,
    this.width,
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: circular,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: hasBorder ? Border.all(color: const Color(0xffF2F4F7)) : null,
          borderRadius: circular,
        ),
        child: child,
      ),
    );
  }
}
