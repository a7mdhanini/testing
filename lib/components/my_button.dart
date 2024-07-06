import 'package:flutter/material.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';

class MyButton extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onPressed;
  final String title;

  const MyButton({
    required this.title,
    this.width,
    this.height,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      height: height ?? 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.red),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: Sizes.allSizes(context) / 80,
          ),
        ),
      ),
    );
  }
}
