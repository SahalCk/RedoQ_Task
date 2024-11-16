import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: whiteColor,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Center(
            child: Image.asset('assets/redoq_logo.png',
                color: blackColor, height: Adaptive.h(15))),
      ),
    );
  }
}
