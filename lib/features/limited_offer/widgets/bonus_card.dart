import 'package:flutter/material.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/features/limited_offer/widgets/inner_shadow.dart';

class BonusCard extends StatelessWidget {
  final String bonusText;

  const BonusCard({super.key, required this.bonusText});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -12,
      left: 20,
      right: 20,
      child: InnerShadow(
        blur: 8.33,
        color: ShartflixColors.white,
        offset: const Offset(0, 0),
        child: Container(
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _getBonusCardColor(bonusText),
          ),
          child: Center(
            child: Text(
              bonusText,
              style: const TextStyle(
                color: ShartflixColors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBonusCardColor(String bonusText) {
    switch (bonusText) {
      case "+10%":
        return ShartflixColors.gradientRedDark;
      case "+70%":
        return ShartflixColors.gradientPurple;
      case "+35%":
        return ShartflixColors.gradientRedDark;
      default:
        return ShartflixColors.gradientRedDark;
    }
  }
}
