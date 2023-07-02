import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn_out_line.widget.dart';
import 'package:movies_app/presentation/widgets/default_container.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
import 'package:movies_app/service/navigation.service.dart';

class SignInUpPage extends StatelessWidget {
  const SignInUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
          child: Column(
        children: [
          Image.asset('assets/images/logo.png'),
          space32,
          Btn(
            expanded: true,
            verticalPadding: 18,
            child: const Txt(
              'Sign In',
              color: white,
              size: 20,
            ),
            onPressed: () => go(R.signIn, context),
          ),
          space32,
          BtnOutLine(
            expanded: true,
            verticalPadding: 18,
            child: const Txt(
              'Sign Up',
              color: white,
              size: 20,
            ),
            onPressed: () => go(R.signUp, context),
          ),
        ],
      )),
    );
  }
}
