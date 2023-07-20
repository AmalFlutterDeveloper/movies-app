import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// hide status bar `open application in full screen mode`
void hideStatusBar() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

/// show status bar
void showStatusBar() {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
}

/// un-focus current item and hide keyboard
void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

/// don't rotate screen if user rotate his phone
void preventLandScapeMode() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}
