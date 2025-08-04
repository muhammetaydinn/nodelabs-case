import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ShartflixPadding {
  p2(2.0),
  p4(4.0),
  p6(6.0),
  p8(8.0),
  p10(10.0),
  p12(12.0),
  p14(14.0),
  p16(16.0),
  p18(18.0),
  p20(20.0),
  p22(22.0),
  p24(24.0),
  p26(26.0),
  p28(28.0),
  p32(32.0),
  p36(36.0),
  p48(48.0),
  p50(50.0),
  p64(64.0),
  p80(80.0),
  p128(128.0);

  final double paddingValue;
  const ShartflixPadding(this.paddingValue);
}

extension PaddingExtension on ShartflixPadding {
  REdgeInsets get all => REdgeInsets.all(paddingValue);

  REdgeInsets get horizontal => REdgeInsets.symmetric(horizontal: paddingValue);

  REdgeInsets get vertical => REdgeInsets.symmetric(vertical: paddingValue);

  REdgeInsets get onlyTop => REdgeInsets.only(top: paddingValue);

  REdgeInsets get onlyBottom => REdgeInsets.only(bottom: paddingValue);

  REdgeInsets get onlyLeft => REdgeInsets.only(left: paddingValue);

  REdgeInsets get onlyRight => REdgeInsets.only(right: paddingValue);

  REdgeInsets custom({double? top, double? right, double? bottom, double? left}) {
    return REdgeInsets.only(
      top: (top ?? paddingValue),
      right: (right ?? paddingValue),
      bottom: (bottom ?? paddingValue),
      left: (left ?? paddingValue),
    );
  }
}
