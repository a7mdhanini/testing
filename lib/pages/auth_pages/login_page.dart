import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/components/my_text_field.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_images.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/auth_crl/auth_crl.dart';
import 'package:testing/pages/auth_pages/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<AuthCrl>(
        init: AuthCrl(),
        builder: (crl) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Form(
                key: crl.loginFormKey,
                child: Column(
                  children: [
                    SizedBox(height: Sizes.statusBarHeight(context)),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: SizedBox(
                        width: Sizes.width(context),
                        height: Sizes.height(context) / 5,
                        child: Image.asset(AppImages.logo),
                      ),
                    ),
                    Text(
                      'Avocado Market',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: Sizes.allSizes(context) / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: AppColors.red,
                        fontSize: Sizes.allSizes(context) / 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    MyTextField(
                      width: Sizes.width(context) / 1.2,
                      hintText: 'Email',
                      onChanged: (newVal) {
                        crl.setEmail(newVal);
                      },
                      validator: (p0) {
                        if (!crl.userModel.email.isEmail) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    MyTextField(
                      width: Sizes.width(context) / 1.2,
                      hintText: 'Password',
                      suffixIcon: crl.isVisable
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: !crl.isVisable,
                      onTapSuffixIcon: () {
                        crl.setIsVisable();
                      },
                      onChanged: (newVal) {
                        crl.setPassword(newVal);
                      },
                      validator: (p0) {
                        if (crl.userModel.password.length < 8) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 50),
                    crl.isLoading
                        ? LoadingAnimationWidget.beat(
                            color: AppColors.orange, size: 18)
                        : MyButton(
                            title: 'Login',
                            onPressed: () {
                              crl.logIn(context);
                            },
                          ),
                    TextButton(
                      onPressed: () {
                        crl.clearData();
                        Get.off(() => const SignUpPage());
                      },
                      child: const Text('SignUp'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
