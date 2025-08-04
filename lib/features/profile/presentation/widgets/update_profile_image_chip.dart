import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/features/profile/presentation/pages/update_profile_image_page.dart';

import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_padding.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';

class UpdateProfileImageChip extends StatelessWidget {
  const UpdateProfileImageChip({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          UpdateProfileImagePage.name,
          queryParameters: {'fromProfile': 'true'},
        );
      },
      child: Container(
        padding: ShartflixPadding.p6.all,
        decoration: BoxDecoration(
          color: ShartflixColors.brandRed,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: ShartflixColors.white20),
        ),
        child: Text(
          context.tr('profile.selectPhoto'),
          style: ShartflixTextStyles.categoryTitle.copyWith(fontSize: 13.sp),
        ),
      ),
    );
  }
}
