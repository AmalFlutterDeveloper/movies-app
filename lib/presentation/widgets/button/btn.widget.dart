import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool expanded;
  final BorderRadius? radius;
  final Color? color;
  final double? elevation;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool enable;

  const Btn({
    super.key,
    required this.child,
    this.onPressed,
    this.expanded = false,
    this.radius,
    this.color,
    this.elevation,
    this.verticalPadding,
    this.horizontalPadding,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
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
          backgroundColor: color,
        ),
        onPressed: enable ? () => onPressed?.call() : null,
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
