import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/design_system/theme/shartflix_padding.dart';

import '../../../../core/design_system/custom_widgets/shartflix_image_widgets.dart';
import '../../../../core/design_system/theme/shartflix_colors.dart';

class NavBarItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final String label;
  final bool isSelected;
  final StatefulNavigationShell child;

  const NavBarItem({
    super.key,
    required this.index,
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        child.goBranch(index, initialLocation: child.currentIndex == index);
      },

      child: Container(
        width: double.infinity,
        padding: ShartflixPadding.p8.horizontal + ShartflixPadding.p6.vertical,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          border: Border.all(color: ShartflixColors.white20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShartflixSvgImage(
              assetPath: iconPath,
              width: 30,
              height: 30,
              color: ShartflixColors.white,
            ),
            8.2.horizontalSpace,
            Text(
              label,
              style: const TextStyle(
                color: ShartflixColors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
