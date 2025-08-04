import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_image_widgets.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_shimmer_widgets.dart';
import 'package:shartflix/core/design_system/theme/shartflix_text_styles.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_state.dart';
import 'package:shartflix/features/profile/presentation/widgets/update_profile_image_chip.dart';

import '../../../../core/design_system/theme/shartflix_colors.dart';
import '../../../../core/design_system/theme/shartflix_padding.dart';

class UserHeaderRow extends StatelessWidget {
  const UserHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileBloc, GetProfileState>(
      builder: (context, state) {
        return Padding(
          padding: ShartflixPadding.p24.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 62, // radius 31 * 2
                height: 62,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    if (state is GetProfileLoading)
                      ShimmerBox(
                        width: 62,
                        height: 62,
                        borderRadius: 31,
                        baseColor: ShartflixColors.white10,
                        highlightColor: ShartflixColors.white20,
                      )
                    else
                      ShartflixImageWidget(
                        imageUrl:
                            state is GetProfileSuccess &&
                                state.user.photoUrl != null &&
                                state.user.photoUrl!.isNotEmpty
                            ? state.user.photoUrl
                            : null,
                        assetPath: 'assets/images/profile_placeholder.png',
                        width: 62,
                        height: 62,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(31),
                      ),
                  ],
                ),
              ),
              9.05.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  switch (state) {
                    GetProfileSuccess() => Text(
                      state.user.name ?? '-',
                      style: ShartflixTextStyles.labelMedium.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                    GetProfileLoading() => ShimmerText(
                      width: 80.w,
                      height: 16.h,
                      borderRadius: 4,
                      baseColor: ShartflixColors.white10,
                      highlightColor: ShartflixColors.white20,
                    ),
                    GetProfileFailure() => Text(
                      context.tr('profile.loadingFailed'),
                      style: ShartflixTextStyles.labelMedium.copyWith(
                        fontSize: 15.sp,
                        color: ShartflixColors.white50,
                      ),
                    ),
                    _ => Text(
                      context.tr('profile.user'),
                      style: ShartflixTextStyles.labelMedium.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  },
                  switch (state) {
                    GetProfileSuccess() => Text(
                      "${context.tr('profile.id')}: ${state.user.id?.substring(0, 6) ?? 'N/A'}",
                      style: ShartflixTextStyles.movieDescription.copyWith(
                        color: ShartflixColors.white50,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GetProfileLoading() => ShimmerText(
                      width: 60.w,
                      height: 12.h,
                      margin: EdgeInsets.only(top: 2.h),
                      borderRadius: 4,
                      baseColor: ShartflixColors.white10,
                      highlightColor: ShartflixColors.white20,
                    ),
                    GetProfileFailure() => Text(
                      "${context.tr('profile.id')}: ${context.tr('profile.loadingFailed')}",
                      style: ShartflixTextStyles.movieDescription.copyWith(
                        color: ShartflixColors.white50,
                      ),
                    ),
                    _ => Text(
                      "${context.tr('profile.id')}: N/A",
                      style: ShartflixTextStyles.movieDescription.copyWith(
                        color: ShartflixColors.white50,
                      ),
                    ),
                  },
                ],
              ),
              const Spacer(),
              const UpdateProfileImageChip(),
            ],
          ),
        );
      },
    );
  }
}
