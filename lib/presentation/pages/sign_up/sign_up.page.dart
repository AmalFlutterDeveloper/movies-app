import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/validation.dart';
import 'package:movies_app/presentation/widgets/appbar.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/text_field/custom_form.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            const Appbar(title: 'Sign Up'),
            space75,
            const Txt('Hello Welcome', size: 24, weight: 700, color: white),
            space18,
            Txt(
              'Welcome please enter your data to create your account',
              size: 16,
              weight: 500,
              color: hintColor,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            space48,
            InputTextField(
              title: 'Full Name',
              hint: 'Enter your Name',
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(Icons.person_2_outlined),
              validations: [require],
            ),
            space18,
            InputTextField(
              title: 'Email',
              hint: 'Enter your Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            space18,
            InputTextField(
              title: 'Password',
              keyboardType: TextInputType.visiblePassword,
              hint: 'Enter your Password',
              prefixIcon: const Icon(Icons.lock_outline),
            ),
            space18,
            InputTextField(
              title: 'Phone Number',
              hint: 'Enter your Number',
              prefixIcon: const Icon(Icons.phone_in_talk_outlined),
              keyboardType: TextInputType.phone,
            ),
            space32,
            Btn(
              expanded: true,
              verticalPadding: 18,
              child: const Txt(
                'Sign Up',
                color: white,
                size: 20,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
