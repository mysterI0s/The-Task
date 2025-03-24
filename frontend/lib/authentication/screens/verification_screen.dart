import 'package:frontend/core/constants/app_strings.dart';
import 'package:frontend/core/generic_widgets/main_button.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:frontend/authentication/screens/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 12.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                AppStrings.verification,
                textAlign: TextAlign.center,
                style: AppTextStyle.f40W700NearBlackColor,
              ),
              SizedBox(height: 232.h),
              Align(
                alignment: Alignment.center,
                child: Text(
                  AppStrings.enterVerificationCode,
                  style: AppTextStyle.f12W400NearBlackColor.copyWith(
                    fontSize: 12.sp,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              PinCodeTextField(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                appContext: context,
                length: 4,
                controller: pinController,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(16.r),
                  fieldHeight: 48.h,
                  fieldWidth: 50.w,
                  activeColor: AppColors.borderColor,
                  inactiveColor: AppColors.borderColor,
                  selectedColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 42.h),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: AppStrings.didNotReceiveCode,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.resend,
                        style: AppTextStyle.f12W400NearBlackColor.copyWith(
                          fontSize: 12.sp,
                          color: Colors.teal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 93.h),
              MainButton(
                text: AppStrings.enterCode,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NewPasswordScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
