import 'package:flutter/material.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';

void myAleartDialog(BuildContext context, {String text = ''}) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.allSizes(context) / 80,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        actions: [
          MyButton(
            width: Sizes.width(context) / 4,
            height: 50,
            title: 'Ok',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
