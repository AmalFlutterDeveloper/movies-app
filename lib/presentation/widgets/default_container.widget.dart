// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constant/padding.core.dart';

class DefaultBackground extends StatelessWidget {
  final Widget child;
  const DefaultBackground({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.7, 1],
        colors: [
          Color(0xff06081B),
          Color(0xff4B3675),
        ],
      )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/bg.svg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: edge24,
            child: child,
          ),
        ],
      ),
    );
  }
}
