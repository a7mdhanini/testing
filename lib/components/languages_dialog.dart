import 'package:flutter/material.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';

void languagesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Change Languages',
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 80,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            MyButton(
              title: 'English',
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            MyButton(
              title: 'العربية',
              onPressed: () {},
            ),
          ],
        ),
      );
    },
  );
}
