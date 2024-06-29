import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.tablet,
    required this.desktop,
    super.key,
  });

  /// Mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  ///Tablet
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1200 &&
        MediaQuery.of(context).size.width >= 768;
  }

  ///Desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1200 then we consider it a desktop
    if (size.width >= 1200) {
      return desktop;
    }
    // If width it less then 1200 and more then 768 we consider it as tablet
    else if (size.width >= 768) {
      return tablet;
    }
    // Or less then that we called it mobile
    else if (size.width >= 376 && size.width <= 768) {
      return mobile;
    } else {
      return mobile;
    }
  }
}
