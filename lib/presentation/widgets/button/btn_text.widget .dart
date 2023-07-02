import 'package:flutter/material.dart';

class BtnTxt extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final bool expanded;
  final BorderRadius? radius;

  final double? elevation;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool disableMargin;

  const BtnTxt({
    super.key,
    required this.child,
    this.onPressed,
    this.expanded = false,
    this.radius,
    this.elevation,
    this.verticalPadding,
    this.horizontalPadding,
    this.disableMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          tapTargetSize: disableMargin
              ? MaterialTapTargetSize.shrinkWrap
              : MaterialTapTargetSize.padded,
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
