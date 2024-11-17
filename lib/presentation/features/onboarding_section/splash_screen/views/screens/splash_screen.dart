import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:redoq/presentation/routes/route_names.dart';
import 'package:redoq/presentation/features/onboarding_section/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:redoq/presentation/widgets/snack_bar_widgets.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SplashScreenBloc>().add(CheckedUserAlreadyLoggedInEvent());
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarColor: whiteColor,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: BlocListener<SplashScreenBloc, SplashScreenState>(
        listenWhen: (previous, current) => current is SplashScreenActionState,
        listener: (context, state) {
          if (state is UserAlreadyLoggedInState) {
            context
                .pushReplacementNamed(RedoqRouteNames.viewUsersDetailsScreen);
          } else if (state is SomethingWentWrongState) {
            RedoqSnackBarWidgets().errorSnackBar(context, state.error);
          } else {}
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
