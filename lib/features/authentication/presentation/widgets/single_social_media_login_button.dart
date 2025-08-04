import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/design_system/theme/shartflix_padding.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final String imagePath;
  const SocialMediaLoginButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      padding: ShartflixPadding.p20.all,
      decoration: BoxDecoration(
        color: ShartflixColors.white10,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: ShartflixColors.white20, width: 1.w),
      ),
      alignment: Alignment.center,
      child: ShartflixSvgImage(assetPath: imagePath, width: 20.w, height: 20.h),
    );
  }
}
