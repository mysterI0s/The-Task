import 'package:frontend/core/constants/app_images.dart';
import 'package:frontend/core/constants/app_strings.dart';
import 'package:frontend/presentation/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';
import 'package:frontend/presentation/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:frontend/presentation/generic_widgets/main_button.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:frontend/presentation/views/authentication_screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/domain/cubits/auth_cubit.dart';
import 'package:frontend/domain/cubits/auth_state.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUpScreen({super.key});

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
                  AppStrings.signup,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f40W700NearBlackColor,
                ),
                SizedBox(height: 40.h),

                // First Name
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.firstName,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: firstNameController,
                ),
                SizedBox(height: 20.h),

                // Last Name
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.lastName,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: lastNameController,
                ),
                SizedBox(height: 20.h),

                // Email
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
                  controller: emailAddressController,
                ),
                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.phoneNumber,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.password,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 20.h),

                // Confirm Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.confirmPassword,
                    style: AppTextStyle.f12W400NearBlackColor.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextFormField(
                  isConfirmPassword: true,
                  controller: confirmPasswordController,
                ),
                SizedBox(height: 40.h),

                BlocConsumer<AuthCubit, AuthState>(
                  builder: (BuildContext context, AuthState state) {
                    if (state is RegisterLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return MainButton(
                        text: AppStrings.signup,
                        onPressed: () {
                          final regex = RegExp(
                              r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
                          final firstName = firstNameController.text.trim();
                          final lastName = lastNameController.text.trim();
                          final email = emailAddressController.text.trim();
                          final phoneNumber = phoneNumberController.text.trim();
                          final password = passwordController.text.trim();
                          final confirmPassword =
                              confirmPasswordController.text.trim();

                          if (firstName.isEmpty ||
                              lastName.isEmpty ||
                              email.isEmpty ||
                              phoneNumber.isEmpty ||
                              password.isEmpty ||
                              confirmPassword.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(AppStrings.pleaseFillAllFields),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (!regex.hasMatch(password)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(AppStrings.invalidPassword),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (password != confirmPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(AppStrings.passwordsDoNotMatch),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            context.read<AuthCubit>().register(
                                  email,
                                  firstName,
                                  lastName,
                                  phoneNumber,
                                  password,
                                  confirmPassword,
                                );
                          }
                        },
                      );
                    }
                  },
                  listener: (BuildContext context, AuthState state) {
                    if (state is RegisterSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.signedUpSuccessfully),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                          (Route<dynamic> route) => false,
                        );
                      });
                    }

                    if (state is RegisterErrorState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                ),
                SizedBox(height: 32.h),

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
                          icon: SvgPicture.asset(AppImages.facebook,
                              height: 32.r, width: 32.r),
                          onPressed: () {},
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(AppImages.chrome,
                              height: 32.r, width: 32.r),
                          onPressed: () {},
                        ),
                        SizedBox(width: 18.w),
                        IconButton(
                          icon: SvgPicture.asset(AppImages.x,
                              height: 32.r, width: 32.r),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.haveAccount,
                        style: AppTextStyle.f12W400NearBlackColor
                            .copyWith(fontSize: 12.sp)),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      },
                      child: Text(
                        AppStrings.login,
                        style: AppTextStyle.f12W400NearBlackColor.copyWith(
                            fontSize: 12.sp, color: AppColors.primaryColor),
                      ),
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
