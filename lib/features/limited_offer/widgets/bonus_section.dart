import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/design_system/theme/shartflix_text_styles.dart';
import 'package:shartflix/features/limited_offer/bonus_model.dart';
import 'package:shartflix/features/limited_offer/widgets/inner_shadow.dart';

import '../../../core/design_system/custom_widgets/shartflix_image_widgets.dart';

class BonusSection extends StatelessWidget {
  const BonusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bonusList = BonusModel.getBonusList();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.55, 0.50),
          radius: 1.73,
          colors: [
            Colors.white.withValues(alpha: 0.10),
            Colors.white.withValues(alpha: 0.03),
          ],
        ),
        border: Border.all(color: ShartflixColors.white10, width: 1.0),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            Text(
              'Alacağınız Bonuslar',
              style: ShartflixTextStyles.headlineMedium.copyWith(
                color: ShartflixColors.white,
                fontSize: 20.sp,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: bonusList.map((bonus) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InnerShadow(
                      blur: 5.33,
                      color: ShartflixColors.white,
                      offset: const Offset(0, 0),
                      child: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ShartflixColors.gradientRedDark,
                        ),
                        child: Center(
                          child: ShartflixImageWidget(
                            assetPath: bonus.icon,
                            width: 40.w,
                            height: 40.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      bonus.description,
                      textAlign: TextAlign.center,
                      style: ShartflixTextStyles.bodySmall.copyWith(
                        color: ShartflixColors.white,
                        fontSize: 12.sp,
                        height: 1.2,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
