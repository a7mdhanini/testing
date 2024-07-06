import 'package:flutter/material.dart';
import 'package:testing/constants/app_colors.dart';

class MyContainer extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;

  const MyContainer({
    this.onTap,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(2, 2),
              spreadRadius: 3,
              blurRadius: 5,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
