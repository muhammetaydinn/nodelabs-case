import 'package:flutter/material.dart';
import '../theme/shartflix_colors.dart';
import '../theme/shartflix_sizes.dart';
import '../theme/shartflix_padding.dart';
import '../theme/shartflix_text_styles.dart';

class ShartflixButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final EdgeInsets? padding;
  final double? height;
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final Gradient? gradient;
  final Color? foreGroundColor;
  final double? borderRadius;
  final double? elevation;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? width;
  final MainAxisSize? mainAxisSize;
  final bool isLoading;
  final Color? loadingColor;
  final double? loadingSize;
  final AlignmentGeometry? alignment;
  final Color? disabledBackgroundColor;
  final bool expandWidth;

  const ShartflixButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.padding,
    this.margin,
    this.height,
    this.backgroundColor,
    this.gradient,
    this.foreGroundColor,
    this.borderRadius,
    this.elevation,
    this.borderSide,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
    this.mainAxisSize,
    this.isLoading = false,
    this.loadingColor,
    this.loadingSize,
    this.alignment,
    this.disabledBackgroundColor,
    this.expandWidth = true,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Container(
        decoration: gradient != null
            ? BoxDecoration(gradient: gradient, borderRadius: BorderRadius.circular(borderRadius ?? ShartflixSizes.size8))
            : null,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: padding ?? ShartflixPadding.p16.horizontal,
            minimumSize: Size(width ?? (expandWidth ? double.infinity : 0), height ?? ShartflixSizes.size48),
            maximumSize: width != null ? Size(width!, double.infinity) : null,
            backgroundColor: gradient != null ? Colors.transparent : (backgroundColor ?? ShartflixColors.brandRed),
            foregroundColor: foreGroundColor ?? ShartflixColors.white,
            disabledForegroundColor: ShartflixColors.white40,
            disabledBackgroundColor: disabledBackgroundColor ?? ShartflixColors.white20,
            elevation: elevation ?? 0,
            alignment: alignment ?? Alignment.center,
            textStyle: textStyle ?? ShartflixTextStyles.primaryButtonText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? ShartflixSizes.size8),
              side: borderSide ?? BorderSide.none,
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),

          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? SizedBox(
                  height: loadingSize ?? ShartflixSizes.size24,
                  width: loadingSize ?? ShartflixSizes.size24,
                  child: CircularProgressIndicator(color: loadingColor ?? (foreGroundColor ?? ShartflixColors.white), strokeWidth: 2.5),
                )
              : Row(
                  mainAxisSize: mainAxisSize ?? MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) ...[prefixIcon!, SizedBox(width: ShartflixSizes.size8)],
                    Flexible(
                      child: Text(
                        title,
                        style: textStyle ?? ShartflixTextStyles.primaryButtonText.copyWith(color: foreGroundColor ?? ShartflixColors.white),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (suffixIcon != null) ...[SizedBox(width: ShartflixSizes.size8), suffixIcon!],
                  ],
                ),
        ),
      ),
    );
  }
}
