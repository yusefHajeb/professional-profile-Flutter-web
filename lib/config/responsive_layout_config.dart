import 'package:flutter/material.dart';

class ResponsiveLayoutConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late bool isMobile;
  static late bool isTablet;
  static late bool isDesktop;

  // For font sizes and image sizes
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;
  static double textScaleFactor = 1.0;

  static double scaleWidth(double width) {
    return width * blockSizeHorizontal;
  }

  // Get relative width according to screen size
  static double width(double width) {
    return (width / 375.0) * screenWidth;
  }

  static double scaleHeight(double height) {
    return height * blockSizeVertical;
  }

  static double scaleText(double fontSize) {
    return fontSize * safeBlockHorizontal;
  }

  static double height(double height) {
    return (height / 812.0) * screenHeight;
  }

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _mediaQueryData = MediaQuery.of(context);

    // Define your breakpoints
    isMobile = screenWidth < 600;
    isTablet = screenWidth >= 600 && screenWidth < 1200;
    isDesktop = screenWidth >= 1200;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  // Get appropriate value based on screen type
  static T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? defaultValue,
  }) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    if (mobile != null) return mobile;
    if (defaultValue != null) return defaultValue;
    throw ArgumentError('No value provided for the current screen type');
  }

  // Get appropriate padding based on screen type
  static EdgeInsets padding({
    required EdgeInsets mobile,
    EdgeInsets? tablet,
    EdgeInsets? desktop,
  }) {
    return responsive(
      mobile: mobile,
      tablet: tablet,
      desktop: desktop,
    );
  }
}
