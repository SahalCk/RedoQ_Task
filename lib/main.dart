import 'package:flutter/material.dart';
import 'package:redoq/config/routes/route_config.dart';
import 'package:redoq/config/theme/redoq_app_theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const RedoQApp());
}

class RedoQApp extends StatelessWidget {
  const RedoQApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
            title: 'RedoQ App',
            debugShowCheckedModeBanner: false,
            theme: RedoqAppTheme.lightTheme,
            routerConfig: RedoqRouteConfig.routeConfig);
      },
    );
  }
}
