import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redoq/presentation/features/main_section/update_user_details/bloc/update_user_details_screen_bloc.dart';
import 'package:redoq/presentation/features/main_section/view_users_details/bloc/view_users_details_screen_bloc.dart';
import 'package:redoq/presentation/routes/route_config.dart';
import 'package:redoq/presentation/theme/redoq_app_theme.dart';
import 'package:redoq/presentation/features/onboarding_section/splash_screen/bloc/splash_screen_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RedoQApp());
}

class RedoQApp extends StatelessWidget {
  const RedoQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashScreenBloc()),
        BlocProvider(create: (context) => ViewUsersDetailsScreenBloc()),
        BlocProvider(create: (context) => UpdateUserDetailsScreenBloc())
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return MaterialApp.router(
              title: 'RedoQ App',
              debugShowCheckedModeBanner: false,
              theme: RedoqAppTheme().getThemeData,
              routerConfig: RedoqRouteConfig.routeConfig);
        },
      ),
    );
  }
}
