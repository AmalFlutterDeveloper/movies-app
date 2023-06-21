import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/service/navigation.service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      go(R.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            stops: [0.2, 1.0],
            end: Alignment.bottomCenter,
            colors: [Color(0xffB76D81), Colors.black],
          ),
        ),
        child: Center(
          child: SvgPicture.asset('assets/images/logo.svg'),
        ),
      ),
    );
  }
}
