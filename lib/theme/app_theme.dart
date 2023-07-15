import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pushplay/utils/color_constants.dart';

/// Global App theme where all the colors and useful general styles programmed so that we will have less customization on dart files
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        colorScheme: const ColorScheme(
            primary: ColorConstants.mainColor,
            onPrimary: Colors.white,
            brightness: Brightness.light,
            secondary: ColorConstants.darkBlack,
            surface: Colors.white,
            onSurface: ColorConstants.mainColor,
            background: Colors.white,
            onBackground: ColorConstants.darkBlack,
            onError: ColorConstants.themeIconColor,
            onSecondary: ColorConstants.themeTextColor,
            error: ColorConstants.themeYellow),
        brightness: Brightness.light,
        primaryColor: ColorConstants.mainColor,
        textTheme: textTheme(),
        iconTheme: const IconThemeData(color: ColorConstants.themeIconColor),
        elevatedButtonTheme: buttonThemeLight(),
        inputDecorationTheme: inputDecorationThemeLight());
  }

  static TextTheme textTheme() {
    return TextTheme(
      headlineLarge: GoogleFonts.sora(
          color: ColorConstants.white, fontWeight: FontWeight.w700),
      headlineMedium: GoogleFonts.sora(color: ColorConstants.themeTextColor, fontWeight: FontWeight.w600),
      headlineSmall: GoogleFonts.redHatText(
          color: ColorConstants.themeTextColor),
      displayLarge: GoogleFonts.redHatText(
          color: ColorConstants.white, fontWeight: FontWeight.bold),
      displayMedium: GoogleFonts.redHatText(
          color: ColorConstants.white, fontWeight: FontWeight.bold),
      displaySmall: GoogleFonts.redHatText(
          color: ColorConstants.white, fontWeight: FontWeight.w400),
      bodyLarge:
          GoogleFonts.redHatText(color: ColorConstants.white, fontSize: 20),
      bodyMedium:
          GoogleFonts.redHatText(color: ColorConstants.themeTextColor, fontSize: 20),
      bodySmall:
          GoogleFonts.redHatText(color: ColorConstants.themeTextColor, fontSize: 16),
      titleLarge: GoogleFonts.sora(
          color: ColorConstants.darkBlack, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.redHatText(
          color: ColorConstants.darkBlack,
          fontSize: 22,
          fontWeight: FontWeight.w500),
      titleSmall: GoogleFonts.redHatText(color: ColorConstants.themeTextColor),
      labelLarge: GoogleFonts.redHatText(
          color: ColorConstants.themeTextColor, fontWeight: FontWeight.w800),
    );
  }

  static InputDecorationTheme inputDecorationThemeLight() {
    return InputDecorationTheme(
        hintStyle: GoogleFonts.sora(color: Colors.grey, fontSize: 18),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        fillColor: ColorConstants.white,
        isDense: true,
        filled: true,
        errorMaxLines: 2,
        labelStyle: GoogleFonts.sora(color: ColorConstants.themeTextColor),
        contentPadding: const EdgeInsets.all(8.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(color: ColorConstants.themeTextColor, width: 0.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(color: ColorConstants.themeTextColor, width: 0.5)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(color: ColorConstants.themeTextColor, width: 0.5)),
        errorStyle: const TextStyle(color: Colors.redAccent),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide:
                BorderSide(color: ColorConstants.themeTextColor, width: 0.5)),
        disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide:
                BorderSide(color: ColorConstants.themeTextColor, width: 0.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                const BorderSide(color: ColorConstants.themeTextColor, width: 0.5)));
  }

  static ElevatedButtonThemeData buttonThemeLight() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20) +
                const EdgeInsets.symmetric(horizontal: 10),
            backgroundColor: ColorConstants.themeTextColor));
  }
}
