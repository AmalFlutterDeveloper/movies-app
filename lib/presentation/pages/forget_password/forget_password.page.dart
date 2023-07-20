import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/presentation/widgets/appbar.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/text_field/custom_form.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
import 'package:movies_app/service/navigation.service.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            const Appbar(title: 'Password'),
            space75,
            const Txt(
              'Forget Password',
              size: 24,
              weight: 700,
              color: white,
            ),
            space18,
            Txt(
              'Please enter your email address to recieve a verification card',
              size: 16,
              weight: 500,
              color: hintColor,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            space48,
            InputTextField(
              title: 'Email',
              hint: 'Enter your Email',
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
            ),
            space32,
            Btn(
              expanded: true,
              verticalPadding: 18,
              child: const Txt(
                'send',
                color: white,
                size: 20,
              ),
              onPressed: () => go(R.verification, context),
            ),
          ],
        ),
      ),
    );
  }
}
