import 'package:frontend/core/constants/app_images.dart';
import 'package:frontend/core/constants/app_strings.dart';
import 'package:frontend/presentation/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:frontend/presentation/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:frontend/presentation/generic_widgets/main_button.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:frontend/presentation/views/authentication_screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TextFormFieldCubit(),
      child: Scaffold(
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
                  AppStrings.forgotPassword,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f40W700NearBlackColor,
                ),
                SizedBox(height: 232.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.email,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: emailController,
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 178.h),
                MainButton(
                  text: AppStrings.sendCode,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VerificationScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 38.h),
                Column(
                  children: [
                    Text(
                      AppStrings.or,
                      style: AppTextStyle.f32W700NearBlackColor.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 21.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.facebook,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // Facebook login
                          },
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.chrome,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // Google login
                          },
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(
                            AppImages.x,
                            height: 32.r,
                            width: 32.r,
                          ),
                          onPressed: () {
                            // X login
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
