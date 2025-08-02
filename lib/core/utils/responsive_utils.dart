import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double getContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      return 1200;
    } else if (width > 800) {
      return width * 0.8;
    }
    return width;
  }

  static int getCrossAxisCount(double width) {
    if (width > 1200) {
      return 3;
    } else if (width > 800) {
      return 2;
    }
    return 1;
  }

  static double getChildAspectRatio(double width) {
    if (width > 1200) {
      return 1.1;
    } else if (width > 800) {
      return 0.9;
    }
    return 1.0;
  }

  static double getPadding(double width) {
    if (width > 1200) {
      return 80;
    } else if (width > 800) {
      return 60;
    }
    return 32;
  }
}
