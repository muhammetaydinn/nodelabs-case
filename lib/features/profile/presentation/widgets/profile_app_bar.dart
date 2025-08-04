import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:ui';

import '../../../../core/design_system/custom_widgets/shartflix_image_widgets.dart';
import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_padding.dart';
import '../../../../core/design_system/theme/shartflix_sizes.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';
import '../../../../core/services/navigation_service.dart';
import '../../../../generated/assets.gen.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../limited_offer/limited_offer_sheet.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      width: double.infinity,
      padding: ShartflixPadding.p24.horizontal,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  context.go(HomePage.path);
                },
                child: Container(
                  padding: ShartflixPadding.p8.all,
                  decoration: BoxDecoration(
                    color: ShartflixColors.white10,
                    shape: BoxShape.circle,
                    border: Border.all(color: ShartflixColors.white20),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: ShartflixColors.white,
                    size: ShartflixSizes.size20,
                  ),
                ),
              ),
            ),
          ),

          Center(
            child: Text(
              context.tr('profile.title'),
              style: ShartflixTextStyles.labelMedium.copyWith(
                color: ShartflixColors.white,
                fontSize: ShartflixSizes.size14,
              ),
            ),
          ),

          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: rootNavigatorKey.currentContext!,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Colors.transparent,
                    barrierColor: Colors.black.withValues(alpha: 0.3),
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: const LimitedOfferSheet(),
                    ),
                  );
                },

                child: Container(
                  padding: ShartflixPadding.p6.all,
                  decoration: BoxDecoration(
                    color: ShartflixColors.brandRed,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: ShartflixColors.white20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShartflixSvgImage(
                        assetPath: Assets.icons.svgIcons.diamondIcon,
                        width: 20,
                        height: 20,
                        color: ShartflixColors.white,
                      ),
                      4.horizontalSpace,
                      Text(
                        context.tr('profile.limitedOffer'),
                        style: ShartflixTextStyles.primaryButtonText.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
