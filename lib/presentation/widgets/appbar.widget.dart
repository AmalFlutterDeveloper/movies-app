// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';

class Appbar extends StatelessWidget {
  final String title;
  const Appbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).viewPadding.top,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => pop(context: context, version: 1),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 24,
              ),
            ),
            Expanded(
              child: Center(
                child: Txt(
                  title,
                  textAlign: TextAlign.center,
                  size: 24,
                  color: white,
                  weight: 700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
