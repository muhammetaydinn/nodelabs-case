import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/features/limited_offer/package_model.dart';

import '../../../core/design_system/theme/shartflix_fonts.dart';
import '../../../core/design_system/theme/shartflix_text_styles.dart';

class PackageContent extends StatelessWidget {
  final PackageModel model;

  const PackageContent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            model.originalAmount.toString(),
            style: ShartflixTextStyles.labelMedium.copyWith(
              fontSize: 15.sp,
              decoration: TextDecoration.lineThrough,
              letterSpacing: 0,
              height: 0,
            ),
          ),
          Text(
            model.totalAmount.toString(),
            style: TextStyle(
              fontWeight: ShartflixFontWeights.black,
              fontSize: 25.sp,
              fontFamily: ShartflixFonts.primaryFont,
              color: ShartflixColors.white,
              height: 0,
            ),
          ),
          Text(
            'Jeton',
            style: ShartflixTextStyles.tabLabel.copyWith(
              color: ShartflixColors.white,
              fontSize: 15.sp,
            ),
          ),
          Text(
            model.price,
            style: TextStyle(
              fontWeight: ShartflixFontWeights.black,
              fontSize: 15.sp,
              fontFamily: ShartflixFonts.montserrat,
              color: ShartflixColors.white,
            ),
          ),
          Text(
            'Başına haftalık',
            style: ShartflixTextStyles.movieDescription.copyWith(
              color: ShartflixColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
