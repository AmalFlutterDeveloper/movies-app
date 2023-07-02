import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/constant/radius.core.dart';

import 'package:movies_app/service/navigation.service.dart';

void main() {
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return DevicePreview.appBuilder(context, child);
        },
        routerConfig: NavigationService.router,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          colorScheme: const ColorScheme.dark(primary: primaryColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: circular24),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, color: white),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(borderRadius: circular24),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 20, color: white),
            ),
          ),
        ));
  }
}
