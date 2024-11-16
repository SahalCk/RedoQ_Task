import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppbarTitleWidget extends StatelessWidget {
  final String title;
  const AppbarTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontSize: 18.2.sp, fontWeight: FontWeight.w500));
  }
}
