import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shartflix/core/design_system/custom_widgets/shartflix_scaffold.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/core/network/dependy_injection/injection.dart';
import 'package:shartflix/features/home/presentation/blocs/favorites_cubit/favorites_cubit.dart';

import '../../../../generated/assets.gen.dart';
import '../widgets/nav_bar_item.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritesCubit>(),
      child: SafeArea(
        bottom: Platform.isAndroid,
        child: ShartflixScaffold(
          extendBody: true,
          backgroundColor: ShartflixColors.darkBackground,
          body: child,
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
            decoration: BoxDecoration(
              color: ShartflixColors.darkBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 120.w),
                    child: NavBarItem(
                      index: 0,
                      iconPath: Assets.icons.svgIcons.homeIcon,
                      label: context.tr('home.home'),
                      isSelected: child.currentIndex == 0,
                      child: child,
                    ),
                  ),
                ),
                12.horizontalSpace,
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 120.w),
                    child: NavBarItem(
                      index: 1,
                      iconPath: Assets.icons.svgIcons.profileIcon,
                      label: context.tr('home.profile'),
                      isSelected: child.currentIndex == 1,
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
