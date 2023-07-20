import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/presentation/widgets/appbar.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/text_field/custom_form.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
import 'package:movies_app/service/navigation.service.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            const Appbar(title: 'Sign In'),
            space75,
            const Txt('Hello Welcome Back',
                size: 24, weight: 700, color: white),
            space18,
            Txt(
              'Welcome back please sign in again',
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
            space18,
            InputTextField(
              title: 'Password',
              hint: 'Enter your Password',
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
            ),
            space12,
            Row(
              children: [
                SizedBox(
                  height: 16,
                  width: 16,
                  child: Checkbox(
                    activeColor: Colors.blue,
                    value: true,
                    onChanged: (value) {},
                  ),
                ),
                space8,
                Txt(
                  'Remember me',
                  size: 12,
                  weight: 300,
                  color: hintColor,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => go(R.forgetPassword, context),
                  child: const Txt(
                    'Forget Password?',
                    size: 12,
                    weight: 300,
                    color: amber,
                  ),
                ),
              ],
            ),
            space32,
            Btn(
                expanded: true,
                verticalPadding: 18,
                child: const Txt(
                  'Sign In',
                  color: white,
                  size: 20,
                ),
                onPressed: () {}),
            space48,
            const Txt(
              "OR",
              size: 16,
              color: amber,
            ),
            space32,
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: hintColor,
                  ),
                ),
                space24,
                Txt(
                  'Sign in with',
                  color: hintColor,
                  size: 16,
                ),
                space24,
                Expanded(
                  child: Container(
                    height: 2,
                    color: hintColor,
                  ),
                )
              ],
            ),
            space32,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icons/google.svg',
                ),
                space32,
                SvgPicture.asset(
                  'assets/images/icons/facebook.svg',
                ),
                space32,
                SvgPicture.asset(
                  'assets/images/icons/apple.svg',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
