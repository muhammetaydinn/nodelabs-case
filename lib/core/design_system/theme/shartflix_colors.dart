import 'package:flutter/material.dart';

class ShartflixColors {
  ShartflixColors._();

  // Ana Renkler
  static const Color brandRed = Color(0xFFE50914);
  static const Color darkBackground = Color(0xFF090909);

  static const Color white = Color(0xFFFFFFFF);

  static Color white10 = white.withAlpha(25); // %10
  static Color white20 = white.withAlpha(51); // %20
  static Color white30 = white.withAlpha(76); // %30
  static Color white40 = white.withAlpha(102); // %40
  static Color white50 = white.withAlpha(128); // %50
  static Color white60 = white.withAlpha(153); // %60
  static Color white70 = white.withAlpha(178); // %70
  static Color white75 = white.withAlpha(191); // %75
  static Color white80 = white.withAlpha(204); // %80
  static Color white90 = white.withAlpha(229); // %90
  static Color white100 = white.withAlpha(255); // %100 (tam opak)

  // Kenarlık rengi (örneğin input border)
  static Color greyBorder = white.withAlpha(51); // %20 beyaz

  // Gradient renkleri
  static const Color gradientRedDark = Color(0xFF6F060B);
  static const Color gradientRedLight = Color(0xFFE50914);
  static const Color gradientPurple = Color(0xFF5949E6);
}
