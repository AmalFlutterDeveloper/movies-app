import 'package:flutter/material.dart';
import 'package:movies_app/core/constant/padding.core.dart';
import 'package:movies_app/presentation/widgets/custom_container.widget.dart';

class BtnBorderedIcon extends StatelessWidget {
  const BtnBorderedIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: edge6,
          child: Icon(icon, size: 16.0, color: color ?? Colors.black),
        ),
      ),
    );
  }
}
