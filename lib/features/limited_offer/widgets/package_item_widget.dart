import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/features/limited_offer/package_model.dart';
import 'package:shartflix/features/limited_offer/widgets/bonus_card.dart';
import 'package:shartflix/features/limited_offer/widgets/package_content.dart';

import '../../../core/design_system/theme/shartflix_padding.dart';

class PackageItems extends StatelessWidget {
  const PackageItems({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PackageModel> packages = [
      const PackageModel(
        bonusText: "+10%",
        originalAmount: 200,
        totalAmount: 330,
        price: "₺99,99",
        gradient: RadialGradient(
          colors: [Color(0xFF6F060B), Color(0xFFE50914)],
          center: Alignment.topCenter,
          radius: 2,
        ),
      ),
      const PackageModel(
        bonusText: "+70%",
        originalAmount: 2000,
        totalAmount: 3375,
        price: "₺799,99",
        gradient: RadialGradient(
          colors: [Color(0xFF5949E6), Color(0xFFE50914)],
          center: Alignment.topLeft,
          radius: 2,
        ),
      ),
      const PackageModel(
        bonusText: "+35%",
        originalAmount: 1000,
        totalAmount: 1350,
        price: "₺399,99",
        gradient: RadialGradient(
          colors: [Color(0xFF6F060B), Color(0xFFE50914)],
          center: Alignment.topCenter,
          radius: 2,
        ),
      ),
    ];
    return Padding(
      padding: ShartflixPadding.p16.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: packages
            .map((package) => PackageItem(model: package))
            .toList(),
      ),
    );
  }
}

class PackageItem extends StatelessWidget {
  final PackageModel model;

  const PackageItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 217.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: model.gradient,
            border: Border.all(color: ShartflixColors.white40, width: 1),
          ),
          child: PackageContent(model: model),
        ),
        BonusCard(bonusText: model.bonusText),
      ],
    );
  }
}
