import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class ShartflixImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String? assetPath;
  final Uint8List? imageData;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final BorderRadius? borderRadius;
  final Color? color;

  const ShartflixImageWidget({
    Key? key,
    this.imageUrl,
    this.assetPath,
    this.imageData,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imageData != null) {
      imageWidget = Image.memory(imageData!, width: width, height: height, fit: fit);
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl!,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) =>
            placeholder ??
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(width: width, height: height, color: Colors.white),
            ),
        errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.broken_image, color: Colors.grey, size: width ?? 24.0),
      );
    } else if (assetPath != null && assetPath!.isNotEmpty) {
      imageWidget = Image.asset(assetPath!, width: width, height: height, fit: fit, color: color);
    } else {
      imageWidget = errorWidget ?? const Center(child: Icon(Icons.broken_image, color: Colors.grey));
    }

    if (borderRadius != null) {
      imageWidget = ClipRRect(borderRadius: borderRadius!, child: imageWidget);
    }

    return imageWidget;
  }
}

class ShartflixSvgImage extends StatelessWidget {
  final String assetPath;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;
  final bool useShimmer;

  const ShartflixSvgImage({
    Key? key,
    required this.assetPath,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.useShimmer = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      fit: fit,
      alignment: alignment,
      placeholderBuilder: useShimmer
          ? (context) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(width: width, height: height, color: Colors.white),
            )
          : null,
    );
  }
}
