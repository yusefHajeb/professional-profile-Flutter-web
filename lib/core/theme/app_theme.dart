import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_extention.dart';

class AppTheme {
  static final _lightAppColors = AppColorsExtension(
    primary: const Color(0xffad9460),
    onPrimary: const Color(0xff605f5e),
    secondary: const Color(0xffad9460),
    onSecondary: const Color(0xff605f5e),
    error: const Color(0xffcf6679),
    onError: const Color(0xff605f5e),
    background: const Color(0xffad9460),
    onBackground: const Color(0xff605f5e),
    surface: const Color(0xffad9460),
    onSurface: const Color(0xff605f5e),
    outline: const Color(0xff605f5e),
    onOutline: const Color(0xffad9460),
    outlineVariant: const Color(0xffad9460),
    shadow: const Color(0xff605f5e),
    scrim: const Color(0xffad9460),
    inverseSurface: const Color(0xff605f5e),
    inverseOnSurface: const Color(0xffad9460),
    scaffoldBackground: const Color(0xffad9460),
    bottomAppBarColor: const Color(0xffad9460),
    systemOverlay0: const Color(0xffad9460),
    systemOverlay1: const Color(0xffad9460),
    systemOverlay2: const Color(0xffad9460),
  );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        primaryColor: _lightAppColors.primary,
        primaryColorDark: _lightAppColors.onPrimary,
        scaffoldBackgroundColor: _lightAppColors.scaffoldBackground,
        hintColor: _lightAppColors.outline,
        focusColor: _lightAppColors.outline,
        hoverColor: _lightAppColors.outline,
        canvasColor: _lightAppColors.surface,
        indicatorColor: _lightAppColors.outline,
        primaryColorLight: _lightAppColors.primary,
        highlightColor: _lightAppColors.outline,
        splashColor: _lightAppColors.outline,
        appBarTheme: AppBarTheme(
          foregroundColor: _lightAppColors.onSurface,
          centerTitle: true,
          backgroundColor: _lightAppColors.primary,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: _lightAppColors.primary,
          background: _lightAppColors.background,
          outline: _lightAppColors.outline,
          inversePrimary: _lightAppColors.inverseSurface,
          inverseSurface: _lightAppColors.inverseSurface,
          brightness: Brightness.light,
          primary: _lightAppColors.primary,
          onPrimary: _lightAppColors.onPrimary,
          secondary: _lightAppColors.secondary,
          onSecondary: _lightAppColors.onSecondary,
          surface: _lightAppColors.surface,
          onSurface: _lightAppColors.onSurface,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.5,
            color: _lightAppColors.onBackground,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 16,
            height: 1.5,
            color: _lightAppColors.onBackground,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 14,
            height: 1.5,
            color: _lightAppColors.onBackground,
          ),
          headlineLarge: GoogleFonts.poppins(
            fontSize: 25,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          headlineMedium: GoogleFonts.poppins(
            fontSize: 28,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          headlineSmall: GoogleFonts.poppins(
            fontSize: 24,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          labelLarge: GoogleFonts.poppins(
            fontSize: 20,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          labelMedium: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          labelSmall: GoogleFonts.poppins(
            fontSize: 16,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 24,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          titleMedium: GoogleFonts.poppins(
            fontSize: 20,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          titleSmall: GoogleFonts.poppins(
            fontSize: 18,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          displayLarge: GoogleFonts.poppins(
            fontSize: 32,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          displayMedium: GoogleFonts.poppins(
            fontSize: 28,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 24,
            height: 1.5,
            color: _lightAppColors.onSurface,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 2,
          shadowColor: _lightAppColors.shadow,
          surfaceTintColor: _lightAppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: _lightAppColors.outline),
          ),
        ),
      );
}
