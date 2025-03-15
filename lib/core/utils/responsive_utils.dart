import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && 
      MediaQuery.of(context).size.width < 900;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900;

  static double getContentWidth(BuildContext context) {
    if (isMobile(context)) return MediaQuery.of(context).size.width * 0.9;
    if (isTablet(context)) return 600;
    return 1200;
  }
}