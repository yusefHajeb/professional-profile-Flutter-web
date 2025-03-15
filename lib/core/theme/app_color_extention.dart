import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.error,
    required this.onError,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.outline,
    required this.onOutline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.scaffoldBackground,
    required this.bottomAppBarColor,
    required this.systemOverlay0,
    required this.systemOverlay1,
    required this.systemOverlay2,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color error;
  final Color onError;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color scaffoldBackground;
  final Color bottomAppBarColor;
  final Color systemOverlay0;
  final Color systemOverlay1;
  final Color systemOverlay2;
  final Color onOutline;

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? error,
    Color? onError,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? outline,
    Color? onOutline,
    Color? outlineVariant,
    Color? shadow,
    Color? scrim,
    Color? inverseSurface,
    Color? inverseOnSurface,
    Color? scaffoldBackground,
    Color? bottomAppBarColor,
    Color? systemOverlay0,
    Color? systemOverlay1,
    Color? systemOverlay2,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      outline: outline ?? this.outline,
      onOutline: onOutline ?? this.onOutline,
      outlineVariant: outlineVariant ?? this.outlineVariant,
      shadow: shadow ?? this.shadow,
      scrim: scrim ?? this.scrim,
      inverseSurface: inverseSurface ?? this.inverseSurface,
      inverseOnSurface: inverseOnSurface ?? this.inverseOnSurface,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      bottomAppBarColor: bottomAppBarColor ?? this.bottomAppBarColor,
      systemOverlay0: systemOverlay0 ?? this.systemOverlay0,
      systemOverlay1: systemOverlay1 ?? this.systemOverlay1,
      systemOverlay2: systemOverlay2 ?? this.systemOverlay2,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t) ?? onPrimary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t) ?? onSecondary,
      error: Color.lerp(error, other.error, t) ?? error,
      onError: Color.lerp(onError, other.onError, t) ?? onError,
      background: Color.lerp(background, other.background, t) ?? background,
      onBackground:
          Color.lerp(onBackground, other.onBackground, t) ?? onBackground,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? onSurface,
      outline: Color.lerp(outline, other.outline, t) ?? outline,
      outlineVariant:
          Color.lerp(outlineVariant, other.outlineVariant, t) ?? outlineVariant,
      shadow: Color.lerp(shadow, other.shadow, t) ?? shadow,
      scrim: Color.lerp(scrim, other.scrim, t) ?? scrim,
      inverseSurface:
          Color.lerp(inverseSurface, other.inverseSurface, t) ?? inverseSurface,
      inverseOnSurface:
          Color.lerp(inverseOnSurface, other.inverseOnSurface, t) ??
              inverseOnSurface,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t) ??
              scaffoldBackground,
      bottomAppBarColor:
          Color.lerp(bottomAppBarColor, other.bottomAppBarColor, t) ??
              bottomAppBarColor,
      systemOverlay0:
          Color.lerp(systemOverlay0, other.systemOverlay0, t) ?? systemOverlay0,
      systemOverlay1:
          Color.lerp(systemOverlay1, other.systemOverlay1, t) ?? systemOverlay1,
      systemOverlay2:
          Color.lerp(systemOverlay2, other.systemOverlay2, t) ?? systemOverlay2,
      onOutline: Color.lerp(onOutline, other.onOutline, t) ?? onOutline,
    );
  }
}
