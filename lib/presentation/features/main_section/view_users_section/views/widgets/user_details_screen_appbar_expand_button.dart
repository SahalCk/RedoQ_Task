import 'package:flutter/material.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDetailsScreenAppBarExpandButton extends StatefulWidget {
  const UserDetailsScreenAppBarExpandButton({super.key});

  @override
  State<UserDetailsScreenAppBarExpandButton> createState() =>
      _UserDetailsScreenAppBarExpandButtonState();
}

class _UserDetailsScreenAppBarExpandButtonState
    extends State<UserDetailsScreenAppBarExpandButton> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        icon: AnimatedSwitcher(
          duration: Durations.short2,
          switchInCurve: Curves.linear,
          child: Icon(
              key: ValueKey(isExpanded),
              isExpanded
                  ? Icons.expand_less_rounded
                  : Icons.expand_more_rounded,
              size: 21.sp,
              color: lightThemeTextColor),
        ));
  }
}
