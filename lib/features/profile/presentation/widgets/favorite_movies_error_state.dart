import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_text_styles.dart';

class FavoriteMoviesErrorState extends StatelessWidget {
  final String message;

  const FavoriteMoviesErrorState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: Column(
          children: [
            Icon(
              Icons.error_outline,
              color: ShartflixColors.white50,
              size: 32.r,
            ),
            8.verticalSpace,
            Text(
              context.tr('favorites.errorMessage'),
              style: ShartflixTextStyles.labelMedium.copyWith(
                color: ShartflixColors.white50,
                fontSize: 14.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
