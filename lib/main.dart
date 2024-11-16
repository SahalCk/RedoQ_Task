import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoq/presentation/routes/route_config.dart';
import 'package:redoq/presentation/theme/redoq_app_theme.dart';
import 'package:redoq/presentation/features/onboarding_section/splash_screen_section/bloc/splash_screen_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const RedoQApp());
}

class RedoQApp extends StatelessWidget {
  const RedoQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => SplashScreenBloc())],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
              title: 'RedoQ App',
              debugShowCheckedModeBanner: false,
              theme: RedoqAppTheme.lightTheme,
              routerConfig: RedoqRouteConfig.routeConfig);
        },
      ),
    );
  }
}
