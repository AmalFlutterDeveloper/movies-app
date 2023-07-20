import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/config.core.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/presentation/widgets/appbar.widget.dart';
import 'package:movies_app/presentation/widgets/button/btn.widget.dart';
import 'package:movies_app/presentation/widgets/default_background.widget.dart';
import 'package:movies_app/presentation/widgets/down_timer.widget.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
import 'package:pinput/pinput.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  /// this timer will be used to control 'resend button' if its allowed to click or not
  final downTimerKey = GlobalKey<DownTimerState>();
  final pinController = TextEditingController();

  /// getting default pinput theme
  PinTheme get defaultPinTheme => PinTheme(
        width: 74,
        height: 70,
        textStyle: const TextStyle(
          fontSize: 24,
          color: primaryColor,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
          color: fillInputColor,
          border: Border.all(color: fillInputColor),
          borderRadius: BorderRadius.circular(16),
        ),
      );

  /// it just a copy of all [defaultPinTheme] but with changing color of border
  PinTheme get focusedPinTheme => defaultPinTheme.copyDecorationWith(
        border: Border.all(color: primaryColor),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultBackground(
        child: Column(
          children: [
            const Appbar(title: 'verification'),
            space75,
            const Txt(
              'Email Verification',
              size: 24,
              weight: 700,
              color: white,
            ),
            space18,
            Txt(
              'Enter your OTP code here',
              size: 16,
              weight: 500,
              color: hintColor,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            space48,
            Pinput(
              controller: pinController,
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: defaultPinTheme,
              showCursor: true,
              cursor: Container(
                width: 24,
                height: 2,
                color: primaryColor,
              ),
              onCompleted: (pin) => hideKeyboard(),
            ),
            space18,
            Text.rich(
              const TextSpan(text: 'Don’t receive OTP code?   ', children: [
                TextSpan(
                    text: 'Send Again',
                    style: TextStyle(
                      color: primaryColor,
                    ))
              ]),
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w400, color: hintColor),
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

  Widget _buildResendTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
          onPressed: () async {
            if (downTimerKey.currentState?.isRunning() == true) {
              // BotToast.showText(text: 'Please Wait');
              return;
            }
            // loadableAction(() async {
            //   if (await widget.options.resend()) {
            //     downTimerKey.currentState?.restart();
            //   }
            // });
          },
          child: const Txt.t(
            'Resend',
            style: TextStyle(
              color: Color(0xffC74730),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        DownTimer(
          key: downTimerKey,
          seconds: 60,
          expand: 100,
          style: const TextStyle(color: Color(0xffC74730)),
          display: (remainingTime) => 'After $remainingTime',
        ),
      ],
    );
  }
}
