import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';

class BtnOutLine extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool expanded;
  final BorderRadius? radius;
  final Color? color;
  final double? elevation;
  final double? verticalPadding;
  final double? horizontalPadding;
  const BtnOutLine({
    super.key,
    required this.child,
    this.onPressed,
    this.expanded = false,
    this.radius,
    this.color,
    this.elevation,
    this.verticalPadding,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: elevation,
          visualDensity: (verticalPadding != null && horizontalPadding != null)
              ? const VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity,
                )
              : verticalPadding != null
                  ? const VisualDensity(vertical: VisualDensity.minimumDensity)
                  : horizontalPadding != null
                      ? const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                        )
                      : null,
          shape: radius == null
              ? null
              : RoundedRectangleBorder(borderRadius: radius!),
          side: BorderSide(color: color ?? primaryColor),
        ),
        onPressed: () => onPressed?.call(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 0,
            horizontal: horizontalPadding ?? 0,
          ),
          child: child,
        ),
      ),
    );
  }
}
