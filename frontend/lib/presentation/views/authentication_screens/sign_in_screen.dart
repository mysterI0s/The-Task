import 'package:frontend/core/constants/app_consts.dart';
import 'package:frontend/core/constants/app_images.dart';
import 'package:frontend/core/constants/app_strings.dart';
import 'package:frontend/presentation/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import 'package:frontend/presentation/generic_widgets/main_button.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_text_style.dart';
import 'package:frontend/presentation/views/authentication_screens/forgot_password_screen.dart';
import 'package:frontend/presentation/views/authentication_screens/sign_up_screen.dart';
import 'package:frontend/domain/cubits/auth_cubit.dart';
import 'package:frontend/domain/cubits/auth_state.dart';
import 'package:frontend/presentation/views/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  AppStrings.login,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f40W700NearBlackColor,
                ),
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.email,
                    style: AppTextStyle.f12W400NearBlackColor
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
                CustomTextFormField(controller: emailController),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.password,
                    style: AppTextStyle.f12W400NearBlackColor
                        .copyWith(fontSize: 12.sp),
                  ),
                ),
                CustomTextFormField(
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ));
                    },
                    child: Text(
                      AppStrings.forgotPassword,
                      style: AppTextStyle.f12W400NearBlackColor
                          .copyWith(fontSize: 12.sp),
                    ),
                  ),
                ),
                SizedBox(height: 178.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      final user = state.model.user;
                      box.write(AppConst.isLoggedIn, true);
                      box.write(AppConst.accessToken, state.model.token);
                      box.write(AppConst.userId, user.userId);
                      box.write(AppConst.userName,
                          "${user.firstName} ${user.lastName}");
                      box.write(AppConst.userEmail, user.email);
                      box.write(AppConst.userPhone, user.phone);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(AppStrings.loggedInSuccessfully),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false,
                        );
                      });
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return state is LoginLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : MainButton(
                            text: AppStrings.login,
                            onPressed: () => _handleLogin(context),
                          );
                  },
                ),
                SizedBox(height: 38.h),
                Text(
                  AppStrings.or,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.f32W700NearBlackColor
                      .copyWith(fontSize: 16.sp),
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
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.doNotHaveAccount,
                      style: AppTextStyle.f12W400NearBlackColor
                          .copyWith(fontSize: 12.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ));
                      },
                      child: Text(
                        AppStrings.signup,
                        style: AppTextStyle.f12W400NearBlackColor.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
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

  void _handleLogin(BuildContext context) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d]{8,}$');
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
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
    } else {
      context.read<AuthCubit>().login(email, password);
    }
  }
}
