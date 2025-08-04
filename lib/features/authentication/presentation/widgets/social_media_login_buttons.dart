import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/features/authentication/presentation/widgets/single_social_media_login_button.dart';

import '../../../../generated/assets.gen.dart';

class SocialMediaLoginButtons extends StatelessWidget {
  const SocialMediaLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaLoginButton(imagePath: Assets.icons.svgIcons.googleLogo),
        8.44.horizontalSpace,
        SocialMediaLoginButton(imagePath: Assets.icons.svgIcons.appleLogo),
        8.44.horizontalSpace,
        SocialMediaLoginButton(imagePath: Assets.icons.svgIcons.facebookLogo),
      ],
    );
  }
}
