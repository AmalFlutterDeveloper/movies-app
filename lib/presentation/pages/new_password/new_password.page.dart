import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/presentation/widgets/appbar.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/text_field/custom_form.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            const Appbar(title: 'New Password'),
            space75,
            const Txt(
              'Create New Password',
              size: 24,
              weight: 700,
              color: white,
            ),
            space18,
            Txt(
              'New password must be different from previously used password.',
              size: 16,
              weight: 500,
              color: hintColor,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            space48,
            InputTextField(
              title: 'New Password',
              hint: 'Enter your Password',
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
            ),
            space48,
            InputTextField(
              title: 'Confirm Password',
              hint: 'Enter your Password',
              prefixIcon: const Icon(Icons.lock_outline),
              keyboardType: TextInputType.visiblePassword,
            ),
            space32,
            Btn(
              expanded: true,
              verticalPadding: 18,
              child: const Txt(
                'Confirm',
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
