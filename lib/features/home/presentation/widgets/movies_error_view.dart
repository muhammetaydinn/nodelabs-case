import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/design_system/theme/shartflix_colors.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_bloc.dart';
import 'package:shartflix/features/home/presentation/blocs/get_movies_bloc/get_movies_event.dart';

class MoviesErrorView extends StatelessWidget {
  final String errorMessage;

  const MoviesErrorView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.r, color: ShartflixColors.white60),
          SizedBox(height: 16.h),
          Text(
            'Bir hata oluştu',
            style: TextStyle(
              fontSize: 18.sp,
              color: ShartflixColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            errorMessage,
            style: TextStyle(fontSize: 14.sp, color: ShartflixColors.white60),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () =>
                context.read<GetMoviesBloc>().add(const GetMoviesRequested()),
            style: ElevatedButton.styleFrom(
              backgroundColor: ShartflixColors.brandRed,
            ),
            child: Text(
              'Tekrar Dene',
              style: TextStyle(color: ShartflixColors.white, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
