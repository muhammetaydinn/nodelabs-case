import 'package:flutter/material.dart';
import 'shartflix_colors.dart';
import 'shartflix_fonts.dart';
import 'shartflix_sizes.dart';

class ShartflixTextStyles {
  ShartflixTextStyles._();

  static TextStyle get displayLarge => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size48,
    fontWeight: ShartflixFontWeights.bold,
    color: ShartflixColors.white,
    letterSpacing: -0.5,
  );

  static TextStyle get displayMedium => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size40,
    fontWeight: ShartflixFontWeights.bold,
    color: ShartflixColors.white,
    letterSpacing: -0.25,
  );

  static TextStyle get displaySmall => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size36,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
  );

  static TextStyle get headlineLarge => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size32,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
  );

  static TextStyle get headlineMedium => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size28,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  static TextStyle get headlineSmall => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size24,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  // Title Styles - Kart başlıkları ve önemli metinler için
  static TextStyle get titleLarge => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size22,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
  );

  static TextStyle get titleMedium => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size20,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  static TextStyle get titleSmall => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size18,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  // Body Styles - Normal içerik metinleri için
  static TextStyle get bodyLarge => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white,
    height: 1.5,
  );

  static TextStyle get bodyMedium => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white,
    height: 1.4,
  );

  static TextStyle get bodySmall => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size12,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white75,
    height: 1.3,
  );

  static TextStyle get labelLarge => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
    letterSpacing: 0.1,
  );

  static TextStyle get labelMedium => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
    letterSpacing: 0.1,
  );

  static TextStyle get labelSmall => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size12,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white75,
    letterSpacing: 0.5,
  );

  static TextStyle get movieTitle => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size18,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
    height: 1.2,
  );

  static TextStyle get movieSubtitle => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white75,
    height: 1.3,
  );

  static TextStyle get movieDescription => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size12,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white40,
    height: 1.4,
  );

  static TextStyle get categoryTitle => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size20,
    fontWeight: ShartflixFontWeights.bold,
    color: ShartflixColors.white,
  );

  static TextStyle get sectionTitle => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size24,
    fontWeight: ShartflixFontWeights.bold,
    color: ShartflixColors.white,
  );

  static TextStyle get appBarTitle => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size20,
    fontWeight: ShartflixFontWeights.bold,
    color: ShartflixColors.white,
  );

  static TextStyle get tabLabel => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  static TextStyle get bottomNavLabel => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size12,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white75,
  );

  static TextStyle get errorText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.brandRed,
  );

  static TextStyle get successText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.regular,
    color: Colors.green,
  );

  static TextStyle get hintText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white40,
  );

  static TextStyle get inputText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.regular,
    color: ShartflixColors.white,
  );

  static TextStyle get primaryButtonText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.semiBold,
    color: ShartflixColors.white,
  );

  static TextStyle get secondaryButtonText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.brandRed,
  );

  static TextStyle get outlinedButtonText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size16,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.white,
  );

  static TextStyle get textButtonText => TextStyle(
    fontFamily: ShartflixFonts.primaryFont,
    fontSize: ShartflixSizes.size14,
    fontWeight: ShartflixFontWeights.medium,
    color: ShartflixColors.brandRed,
  );
}
