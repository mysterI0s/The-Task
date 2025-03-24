import 'package:frontend/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.minWidth = double.infinity,
    required this.text,
    required this.onPressed,
    this.buttonColor = AppColors.primaryColor,
    this.textStyle = AppTextStyle.f16W700LightGrayColor,
  });

  final double minWidth;
  final String text;
  final Function onPressed;
  final Color buttonColor;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      color: buttonColor,
      minWidth: minWidth,
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        text,
        style: textStyle.copyWith(fontSize: textStyle.fontSize?.sp),
      ),
    );
  }
}
