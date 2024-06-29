import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/components/my_text_field.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_images.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/pages/auth/login_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
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
                'Sign Up',
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
                onChanged: (p0) {},
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              MyTextField(
                width: Sizes.width(context) / 1.2,
                hintText: 'Password',
                onChanged: (p0) {},
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(height: 20),
              MyTextField(
                width: Sizes.width(context) / 1.2,
                hintText: 'Confirm Password',
                onChanged: (p0) {},
                validator: (p0) {
                  return null;
                },
              ),
              const SizedBox(height: 50),
              MyButton(
                title: 'Create Account',
                onPressed: () {},
              ),
              TextButton(
                onPressed: () {
                  Get.off(() => const LoginPage());
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
