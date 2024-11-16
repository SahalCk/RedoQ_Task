import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/presentation/routes/route_names.dart';
import 'package:redoq/presentation/features/onboarding_section/splash_screen_section/bloc/splash_screen_bloc.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenBloc>().add(CheckUserAlreadyLoggedInEvent());
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: whiteColor,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listener: (context, state) {
          if (state is UserAlreadyLoggedInState) {
            context
                .pushReplacementNamed(RedoqRouteNames.viewUsersDetailsScreen);
          } else if (state is SomethingWentWrongState) {}
        },
        child: Scaffold(
          body: Center(
              child: Image.asset('assets/redoq_logo.png',
                  color: blackColor, height: Adaptive.h(15))),
        ),
      ),
    );
  }
}
