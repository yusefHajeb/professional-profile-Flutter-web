import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:professional_profile/core/theme/app_texts.dart';

class AppTheme {
  static Future<void> initialize() async {
    await ScreenUtil.ensureScreenSize();
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 54, 131, 255),
    onPrimary: Color.fromARGB(255, 0, 0, 0),
    secondary: Color(0xFFE6EBEB),
    onSecondary: Color(0xFF241E30),
    error: Colors.redAccent,
    inversePrimary: Color.fromARGB(255, 54, 131, 255),
    onSecondaryContainer: Color(0xFF241E30),
    onTertiary: Color(0xFF241E30),
    onTertiaryContainer: Color(0xFF241E30),
    outline: Color(0xFF241E30),
    outlineVariant: Color(0xFF241E30),
    scrim: Color(0xFF241E30),
    shadow: Color(0xFF241E30),
    surfaceTint: Color(0xFF241E30),
    tertiary: Color(0xFF241E30),
    onSurfaceVariant: Color(0xFF241E30),
    onError: Colors.redAccent,
    background: Color(0xFFF5F5F5),
    onBackground: Color(0xFF241E30),
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color.fromARGB(255, 59, 113, 250),
    onPrimary: Colors.white,
    secondary: Color.fromARGB(255, 195, 121, 18),
    onSecondary: Color(0xFFE6EBEB),
    error: Colors.redAccent,
    inversePrimary: Color.fromARGB(255, 244, 247, 252),
    onSecondaryContainer: Color(0xFFE6EBEB),
    onTertiary: Color(0xFFE6EBEB),
    onTertiaryContainer: Color(0xFFE6EBEB),
    outline: Color(0xFFE6EBEB),
    outlineVariant: Color(0xFFE6EBEB),
    scrim: Color(0xFFE6EBEB),
    shadow: Color(0xFFE6EBEB),
    surfaceTint: Color(0xFFE6EBEB),
    tertiary: Color(0xFFE6EBEB),
    onSurfaceVariant: Color(0xFFE6EBEB),
    onError: Colors.white,
    background: Color(0xFF241E30),
    onBackground: Colors.white,
    surface: Color(0xFF241E30),
    onSurface: Colors.white,
    brightness: Brightness.dark,
  );

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);
  static ThemeData lightThemeData = themeData(
    lightColorScheme,
    _lightFocusColor,
  );
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);
  static ThemeData themeDataSelect(ThemeMode mode) =>
      mode == ThemeMode.dark ? darkThemeData : lightThemeData;
  static ThemeData themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) =>
      ThemeData(
        colorScheme: colorScheme,
        primaryColor: colorScheme.inversePrimary,
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        highlightColor: Colors.transparent,
        focusColor: focusColor,
        cardColor: colorScheme.surface,
        dialogBackgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondary,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        disabledColor: colorScheme.onSurface.withOpacity(0.4),
        drawerTheme: DrawerThemeData(
          backgroundColor: colorScheme.surface,
          scrimColor: colorScheme.onBackground.withOpacity(0.5),
          shadowColor: colorScheme.shadow,
          surfaceTintColor: colorScheme.surfaceTint,
          elevation: 16,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
        ),
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: colorScheme.onSecondary,
            borderRadius: BorderRadius.circular(8.0.r),
          ),
          textStyle: AppTextStyles.bodyText.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 14.0.sp,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,

        primaryTextTheme: TextTheme(
          displayLarge: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
          displayMedium: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
          displaySmall: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        expansionTileTheme: ExpansionTileThemeData(
          iconColor: colorScheme.onPrimary,
          collapsedIconColor: colorScheme.onPrimary,
          textColor: colorScheme.onPrimary,
          expandedAlignment: Alignment.centerLeft,
          collapsedTextColor: colorScheme.onPrimary,
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          expansionAnimationStyle: const AnimationStyle(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          collapsedBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          color: colorScheme.surface,
          shadowColor: colorScheme.shadow,
          surfaceTintColor: colorScheme.primary,

          elevation: 0.6,
          // margin: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: colorScheme.secondary,
          textTheme: ButtonTextTheme.primary,
          disabledColor: colorScheme.onSecondary.withOpacity(0.4),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        snackBarTheme: SnackBarThemeData(
          showCloseIcon: true,
          backgroundColor: colorScheme.onSecondary,
          behavior: SnackBarBehavior.fixed,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          dismissDirection: DismissDirection.horizontal,
          insetPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
          actionTextColor: colorScheme.onPrimary,
          contentTextStyle: AppTextStyles.bodyText.copyWith(
            color: colorScheme.primary,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          disabledElevation: 0.0,
          elevation: 0.0,
          focusElevation: 0.0,
          hoverElevation: 0.0,
          highlightElevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        textTheme: TextTheme(
          displayLarge: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
          displayMedium: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
          displaySmall: AppTextStyles.headline6.copyWith(
            color: colorScheme.onPrimary,
          ),
          labelLarge: AppTextStyles.mediumHeadline.copyWith(
            color: colorScheme.onPrimary,
          ),
          labelMedium: AppTextStyles.mediumHeadline.copyWith(
            color: colorScheme.onPrimary,
          ),
          labelSmall: AppTextStyles.bodyText.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 12.0.sp,
            letterSpacing: 1.5,
          ),
          bodyLarge: AppTextStyles.mediumHeadline.copyWith(
            color: colorScheme.onPrimary,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600,
          ),
          bodyMedium: AppTextStyles.mediumHeadline.copyWith(
            color: colorScheme.onPrimary,
            letterSpacing: 0.25,
          ),
          bodySmall: AppTextStyles.smallBodyText.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 11.0.sp,
            letterSpacing: 0.4,
          ),
          headlineLarge: AppTextStyles.largeHeadline.copyWith(
            color: colorScheme.onPrimary,
            letterSpacing: 0.25,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: AppTextStyles.mediumHeadline.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 17.0.sp,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: AppTextStyles.smallHeadline.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleLarge: AppTextStyles.mediumTitle.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
          titleMedium: AppTextStyles.mediumTitle.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ),
          titleSmall: AppTextStyles.bodyText.copyWith(
            color: colorScheme.onPrimary,
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
        //icon theme
        iconTheme: IconThemeData(
          color: colorScheme.onPrimary,
          size: 24.sp,
          opacity: 0.8,
          weight: const Icon(Icons.add).weight,
        ),
        //button style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            shadowColor: colorScheme.shadow,
            backgroundColor: colorScheme.primary,
            disabledBackgroundColor: colorScheme.primary.withOpacity(0.4),
            disabledForegroundColor: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 16.0.h),
            textStyle: AppTextStyles.labelMediumText.copyWith(
              color: colorScheme.onPrimary,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            elevation: 2.0,
            minimumSize: Size(double.infinity, 50.0.h),
            shadowColor: colorScheme.primaryContainer,
            side: BorderSide(color: colorScheme.secondary, width: 1.5),
            disabledForegroundColor: Colors.grey,
            foregroundColor: colorScheme.primary,
            textStyle: AppTextStyles.bodyText.copyWith(
              color: colorScheme.onPrimary,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.r),
            ),
          ).copyWith(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.pressed)) {
                return colorScheme.primary.withOpacity(0.5);
              }
              return colorScheme.surface; // Default Color
            }),
            overlayColor: WidgetStateProperty.all(
              colorScheme.primary.withOpacity(0.1),
            ), // Ripple color
            animationDuration: const Duration(milliseconds: 200),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: colorScheme.primary,
          hoverColor: colorScheme.primary,
          labelStyle: AppTextStyles.bodyText,
          helperStyle: AppTextStyles.bodyText,
          counterStyle: TextStyle(
            color: Colors.grey.withOpacity(0.9),
            fontSize: 12.0.sp,
          ),
          filled: true,
          hintStyle: AppTextStyles.bodyText.copyWith(
            color: Colors.grey.withOpacity(0.9),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              width: 1.0.sp,
            ),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.0.sp),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              width: 1.0.sp,
            ),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 1.0.sp),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.onError, width: 2.0.sp),
            borderRadius: BorderRadius.all(Radius.circular(14.r)),
          ),
        ),
        appBarTheme: AppBarTheme(
          actionsIconTheme: IconThemeData(color: colorScheme.onPrimary),
          iconTheme: IconThemeData(
            color: colorScheme.onPrimary,
            size: 24.sp,
            opacity: 0.8.sp,
            weight: const Icon(Icons.add).weight,
          ),
          shadowColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          color: colorScheme.secondary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: colorScheme.brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
            statusBarBrightness: colorScheme.brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
          ),
        ),
      );
}
