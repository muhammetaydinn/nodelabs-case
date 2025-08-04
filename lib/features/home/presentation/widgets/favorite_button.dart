import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;

  const FavoriteButton({super.key, this.isFavorite = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 49.18.w,
        height: 71.7.h,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
        ),
        child: Center(
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? ShartflixColors.brandRed : Colors.white,
            size: 24.r,
          ),
        ),
      ),
    );
  }
}
