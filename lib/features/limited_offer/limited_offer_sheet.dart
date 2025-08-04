import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_button.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/design_system/theme/shartflix_padding.dart';
import 'package:shartflix/core/design_system/theme/shartflix_text_styles.dart';
import 'package:shartflix/features/limited_offer/widgets/package_item_widget.dart';
import 'package:shartflix/features/limited_offer/widgets/bonus_section.dart';
import 'package:shartflix/generated/assets.gen.dart';

class LimitedOfferSheet extends StatelessWidget {
  const LimitedOfferSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ShartflixPadding.p28.vertical,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.pngImages.sheetBg.path),
          fit: BoxFit.cover,
        ),
        color: ShartflixColors.darkBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.tr('limitedOffer.title'),
            style: ShartflixTextStyles.titleLarge.copyWith(fontSize: 20.sp),
          ),
          Text(
            context.tr('limitedOffer.subtitle'),
            textAlign: TextAlign.center,
            style: ShartflixTextStyles.bodySmall.copyWith(
              fontSize: 12.sp,
              color: ShartflixColors.white,
            ),
          ),

          13.verticalSpace,

          const BonusSection(),
          22.verticalSpace,
          Text(
            context.tr('limitedOffer.selectPackageText'),
            style: ShartflixTextStyles.labelMedium.copyWith(
              color: ShartflixColors.white,
              fontSize: 15.sp,
            ),
          ),
          22.verticalSpace,
          const PackageItems(),
          18.verticalSpace,
          ShartflixButton(
            title: context.tr('limitedOffer.viewAllTokens'),

            onPressed: () {},
            margin: ShartflixPadding.p16.horizontal,
            textStyle: ShartflixTextStyles.labelMedium.copyWith(
              fontSize: 15.sp,
            ),
            borderRadius: 18.r,
          ),
        ],
      ),
    );
  }
}
