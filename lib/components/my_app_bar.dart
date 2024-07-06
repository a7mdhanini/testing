import 'package:flutter/material.dart';
import 'package:testing/constants/app_colors.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.orange,
      title: Text(title),
    );
  }
}
