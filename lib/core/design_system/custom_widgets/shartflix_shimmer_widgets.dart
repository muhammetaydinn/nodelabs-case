import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.margin,
    this.padding,
    this.baseColor = const Color(0xFFEEEEEE),
    this.highlightColor = const Color(0xFFFAFAFA),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }
}

class ShimmerText extends StatelessWidget {
  final double? width;
  final double height;
  final int lines;
  final double spacing;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerText({
    super.key,
    this.width,
    this.height = 14.0,
    this.lines = 1,
    this.spacing = 8.0,
    this.borderRadius = 4.0,
    this.margin,
    this.baseColor = const Color(0xFFEEEEEE),
    this.highlightColor = const Color(0xFFFAFAFA),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          lines,
          (index) => Container(
            width:
                width ??
                (index == lines - 1 && lines > 1 ? 0.7.sw : double.infinity),
            height: height,
            margin: EdgeInsets.only(
              bottom: index == lines - 1 ? 0 : spacing,
              left: margin?.resolve(TextDirection.ltr).left ?? 0,
              right: margin?.resolve(TextDirection.ltr).right ?? 0,
              top: margin?.resolve(TextDirection.ltr).top ?? 0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color baseColor;
  final Color highlightColor;
  final int textLines;

  const ShimmerCard({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12.0,
    this.margin,
    this.padding,
    this.baseColor = const Color(0xFFEEEEEE),
    this.highlightColor = const Color(0xFFFAFAFA),
    this.textLines = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: Border.all(color: ShartflixColors.greyBorder, width: 1),
      ),
      child: ShimmerText(
        lines: textLines,
        baseColor: baseColor,
        highlightColor: highlightColor,
      ),
    );
  }
}
