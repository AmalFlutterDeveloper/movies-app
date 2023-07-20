import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
import 'package:movies_app/service/navigation.service.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            Image.asset('assets/images/logo.png'),
            space32,
            const Txt(
              'watch your favorite movie or series on only one platform you can watch it any time and any where ',
              maxLines: 4,
              size: 20,
              color: Color(0xffD2D2D2),
              textAlign: TextAlign.center,
            ),
            space100,
            Btn(
              expanded: true,
              color: primaryColor,
              verticalPadding: 18,
              onPressed: () => go(R.signInUp, context),
              child: const Txt(
                'Get Started',
                color: white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
