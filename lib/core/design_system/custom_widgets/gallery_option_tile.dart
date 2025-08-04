import 'package:flutter/material.dart';

import '../theme/shartflix_colors.dart';
import '../theme/shartflix_padding.dart';
import '../theme/shartflix_sizes.dart';
import '../theme/shartflix_text_styles.dart';

class GalleryOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const GalleryOptionTile({super.key, required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ShartflixPadding.p20.horizontal + ShartflixPadding.p10.vertical,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              padding: ShartflixPadding.p12.all,
              decoration: BoxDecoration(color: ShartflixColors.brandRed.withOpacity(0.1), borderRadius: BorderRadius.circular(ShartflixSizes.size12)),
              child: Icon(icon, color: ShartflixColors.brandRed, size: ShartflixSizes.size28),
            ),
            SizedBox(width: ShartflixSizes.size16),
            Expanded(child: Text(title, style: ShartflixTextStyles.titleMedium)),
            Icon(Icons.arrow_forward_ios, size: ShartflixSizes.size16, color: ShartflixColors.white40),
          ],
        ),
      ),
    );
  }
}
