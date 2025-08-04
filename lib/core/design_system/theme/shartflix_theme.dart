import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shartflix_colors.dart';
import 'shartflix_fonts.dart';
import 'shartflix_sizes.dart';
import 'shartflix_text_styles.dart';

class ShartflixTheme {
  ShartflixTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: ShartflixFonts.primaryFont,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: ShartflixColors.brandRed,
        onPrimary: ShartflixColors.white,
        secondary: ShartflixColors.gradientPurple,
        onSecondary: ShartflixColors.white,
        error: ShartflixColors.brandRed,
        onError: ShartflixColors.white,
        surface: ShartflixColors.darkBackground,
        onSurface: ShartflixColors.white,
        surfaceContainerHighest: const Color(0xFF1A1A1A),
        onSurfaceVariant: ShartflixColors.white75,
        outline: ShartflixColors.greyBorder,
        shadow: Colors.black54,
        inverseSurface: ShartflixColors.white,
        onInverseSurface: ShartflixColors.darkBackground,
        inversePrimary: ShartflixColors.brandRed,
      ),
      scaffoldBackgroundColor: ShartflixColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: ShartflixColors.darkBackground,
        foregroundColor: ShartflixColors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: ShartflixTextStyles.appBarTitle,
        iconTheme: const IconThemeData(color: ShartflixColors.white, size: 24),
        actionsIconTheme: const IconThemeData(color: ShartflixColors.white, size: 24),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ShartflixColors.darkBackground,
        selectedItemColor: ShartflixColors.brandRed,
        unselectedItemColor: ShartflixColors.white40,
        selectedLabelStyle: ShartflixTextStyles.bottomNavLabel.copyWith(color: ShartflixColors.brandRed),
        unselectedLabelStyle: ShartflixTextStyles.bottomNavLabel,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedIconTheme: const IconThemeData(color: ShartflixColors.brandRed, size: 24),
        unselectedIconTheme: IconThemeData(color: ShartflixColors.white40, size: 24),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: ShartflixColors.darkBackground,
        indicatorColor: ShartflixColors.brandRed.withOpacity(0.2),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: ShartflixColors.brandRed, size: 24);
          }
          return IconThemeData(color: ShartflixColors.white40, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ShartflixTextStyles.bottomNavLabel.copyWith(color: ShartflixColors.brandRed);
          }
          return ShartflixTextStyles.bottomNavLabel;
        }),
        elevation: 8,
        height: 80,
      ),
      textTheme: TextTheme(
        displayLarge: ShartflixTextStyles.displayLarge,
        displayMedium: ShartflixTextStyles.displayMedium,
        displaySmall: ShartflixTextStyles.displaySmall,
        headlineLarge: ShartflixTextStyles.headlineLarge,
        headlineMedium: ShartflixTextStyles.headlineMedium,
        headlineSmall: ShartflixTextStyles.headlineSmall,
        titleLarge: ShartflixTextStyles.titleLarge,
        titleMedium: ShartflixTextStyles.titleMedium,
        titleSmall: ShartflixTextStyles.titleSmall,
        bodyLarge: ShartflixTextStyles.bodyLarge,
        bodyMedium: ShartflixTextStyles.bodyMedium,
        bodySmall: ShartflixTextStyles.bodySmall,
        labelLarge: ShartflixTextStyles.labelLarge,
        labelMedium: ShartflixTextStyles.labelMedium,
        labelSmall: ShartflixTextStyles.labelSmall,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ShartflixColors.brandRed,
          foregroundColor: ShartflixColors.white,
          textStyle: ShartflixTextStyles.primaryButtonText,
          elevation: 2,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, ShartflixSizes.size48),
          padding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size24, vertical: ShartflixSizes.size12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ShartflixColors.white,
          textStyle: ShartflixTextStyles.outlinedButtonText,
          side: BorderSide(color: ShartflixColors.greyBorder, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: Size(double.infinity, ShartflixSizes.size48),
          padding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size24, vertical: ShartflixSizes.size12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ShartflixColors.brandRed,
          textStyle: ShartflixTextStyles.textButtonText,
          padding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size16, vertical: ShartflixSizes.size8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1A1A1A),
        hintStyle: ShartflixTextStyles.hintText,
        labelStyle: ShartflixTextStyles.labelMedium,
        errorStyle: ShartflixTextStyles.errorText,
        contentPadding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size16, vertical: ShartflixSizes.size16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ShartflixColors.greyBorder, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: ShartflixColors.greyBorder, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ShartflixColors.brandRed, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ShartflixColors.brandRed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: ShartflixColors.brandRed, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A1A1A),
        shadowColor: Colors.black26,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: EdgeInsets.all(ShartflixSizes.size8),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: const Color(0xFF1A1A1A),
        titleTextStyle: ShartflixTextStyles.titleLarge,
        contentTextStyle: ShartflixTextStyles.bodyMedium,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 8,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF1A1A1A),
        modalBackgroundColor: Color(0xFF1A1A1A),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: ShartflixColors.brandRed,
        unselectedLabelColor: ShartflixColors.white40,
        labelStyle: ShartflixTextStyles.tabLabel,
        unselectedLabelStyle: ShartflixTextStyles.tabLabel.copyWith(color: ShartflixColors.white40),
        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: ShartflixColors.brandRed, width: 2)),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ShartflixColors.brandRed;
          }
          return ShartflixColors.white40;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ShartflixColors.brandRed.withOpacity(0.5);
          }
          return ShartflixColors.white10;
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ShartflixColors.brandRed;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(ShartflixColors.white),
        side: BorderSide(color: ShartflixColors.greyBorder, width: 2),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ShartflixColors.brandRed;
          }
          return ShartflixColors.white40;
        }),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: ShartflixColors.brandRed,
        linearTrackColor: ShartflixColors.greyBorder,
        circularTrackColor: ShartflixColors.greyBorder,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ShartflixColors.brandRed,
        foregroundColor: ShartflixColors.white,
        elevation: 6,
        highlightElevation: 8,
      ),
      iconTheme: const IconThemeData(color: ShartflixColors.white, size: 24),
      primaryIconTheme: const IconThemeData(color: ShartflixColors.brandRed, size: 24),
      dividerTheme: DividerThemeData(color: ShartflixColors.greyBorder, thickness: 1, space: ShartflixSizes.size16),
      listTileTheme: ListTileThemeData(
        iconColor: ShartflixColors.white,
        textColor: ShartflixColors.white,
        titleTextStyle: ShartflixTextStyles.titleMedium,
        subtitleTextStyle: ShartflixTextStyles.bodyMedium.copyWith(color: ShartflixColors.white75),
        contentPadding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size16, vertical: ShartflixSizes.size8),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF1A1A1A),
        contentTextStyle: ShartflixTextStyles.bodyMedium,
        actionTextColor: ShartflixColors.brandRed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
        elevation: 6,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(8)),
        textStyle: ShartflixTextStyles.bodySmall,
        padding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size12, vertical: ShartflixSizes.size8),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF1A1A1A),
        selectedColor: ShartflixColors.brandRed.withValues(alpha: 0.2),
        disabledColor: ShartflixColors.white10,
        labelStyle: ShartflixTextStyles.labelMedium,
        secondaryLabelStyle: ShartflixTextStyles.labelMedium.copyWith(color: ShartflixColors.brandRed),
        padding: EdgeInsets.symmetric(horizontal: ShartflixSizes.size12, vertical: ShartflixSizes.size8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
