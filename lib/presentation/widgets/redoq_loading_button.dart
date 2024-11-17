import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RedoqLoadingButton extends StatelessWidget {
  final String text;
  final double? height;
  final Function(
          Function startLoading, Function stopLoading, ButtonState buttonState)
      onPressed;
  const RedoqLoadingButton(
      {super.key, required this.text, this.height, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
        height: height ?? 55,
        width: Adaptive.w(100),
        color: primaryColor,
        borderRadius: 9,
        onTap: onPressed,
        roundLoadingShape: false,
        loader: const SizedBox(
            height: 22,
            width: 22,
            child: CircularProgressIndicator(
                color: whiteColor,
                strokeCap: StrokeCap.round,
                strokeWidth: 3.4)),
        child: Text(
          text,
          style: TextStyle(fontSize: 18.sp),
        ));
  }
}
