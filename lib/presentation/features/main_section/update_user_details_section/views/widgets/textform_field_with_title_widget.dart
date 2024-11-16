import 'package:flutter/material.dart';
import 'package:redoq/utils/constants/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextFormFieldWithTitleWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final bool? isLast;
  final TextInputType? textInputType;
  const TextFormFieldWithTitleWidget(
      {super.key,
      required this.controller,
      required this.title,
      required this.hint,
      this.textInputType,
      this.isLast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 15.3.sp,
                fontWeight: FontWeight.w500,
                color: lightThemeSubTextColor)),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter $title';
            }
            return null;
          },
          keyboardType: textInputType,
          style: TextStyle(color: lightThemeTextColor, fontSize: 15.sp),
          textInputAction:
              isLast == true ? TextInputAction.done : TextInputAction.next,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
              hintText: hint,
              hintStyle: TextStyle(color: hintColor, fontSize: 15.sp),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: borderColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(color: primaryColor))),
        )
      ],
    );
  }
}
