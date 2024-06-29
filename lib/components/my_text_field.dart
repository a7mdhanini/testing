import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';

class MyTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final double width;
  final double? hight;
  final IconData? suffixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  final bool buttomMargin;
  final bool readOnly;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTapSuffixIcon;
  final String? prefixIcon;

  const MyTextField({
    super.key,
    required this.hintText,
    this.width = double.infinity,
    this.hight,
    this.inputFormatter,
    this.controller,
    required this.onChanged,
    this.suffixIcon,
    required this.validator,
    this.maxLines = 1,
    this.minLines = 1,
    this.buttomMargin = true,
    this.readOnly = false,
    this.obscureText = false,
    this.keyboardType,
    this.onTapSuffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextFormField(
        readOnly: readOnly,
        obscureText: obscureText,
        inputFormatters: inputFormatter,
        validator: validator,
        controller: controller,
        onChanged: onChanged,

        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,

        ///----input text style
        style: TextStyle(
          color: AppColors.black,
          fontSize: Sizes.allSizes(context) / 90,
        ),
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: Sizes.allSizes(context) / 100,
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),

          ///----Suffix Icon
          suffixIcon: InkWell(
            onTap: onTapSuffixIcon,
            child: (suffixIcon != null)
                ? Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Icon(suffixIcon),
                  )
                : const SizedBox(),
          ),

          ///----Padding
          contentPadding: EdgeInsets.symmetric(
            horizontal: Sizes.width(context) / 25,
            vertical: maxLines > 5 ? Sizes.height(context) / 50 : 15,
          ),

          ///----Focused Border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),

          ///----Enabled Border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),

          ///----Error Border
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red, width: 1.5),
          ),

          ///----Focused Error Border
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: Colors.red.shade200, width: 1.5),
          ),
        ),
      ),
    );
  }
}
