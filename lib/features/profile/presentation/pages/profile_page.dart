import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shartflix/core/network/dependy_injection/injection.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_event.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_favorite_movies_bloc/get_favorite_movies_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_favorite_movies_bloc/get_favorite_movies_event.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_bloc.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_state.dart';
import 'package:shartflix/features/home/presentation/blocs/favorites_cubit/favorites_cubit.dart';

import '../widgets/favorites_section.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/user_header_row.dart';

class ProfilePage extends StatelessWidget {
  static const String name = '/ProfilePage';
  static const String path = '/ProfilePage';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Bottom navigation bar yüksekliğini dinamik olarak hesaplıyoruz
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    final navBarHeight = kBottomNavigationBarHeight + bottomPadding + 20.h;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = getIt<GetProfileBloc>();
            bloc.add(const GetProfileRequested());
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final favoritesCubit = context.read<FavoritesCubit>();
            final bloc = GetFavoriteMoviesBloc(favoritesCubit: favoritesCubit);
            bloc.add(const GetFavoriteMoviesRequested());
            return bloc;
          },
        ),
      ],
      child: BlocListener<UploadProfileImageBloc, UploadProfileImageState>(
        bloc: getIt<UploadProfileImageBloc>(),
        listener: (context, state) {
          if (state is UploadProfileImageSuccess) {
            context.read<GetProfileBloc>().add(const GetProfileRequested());
          }
        },
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                const ProfileAppBar(),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      // Bloc referanslarını al
                      final profileBloc = context.read<GetProfileBloc>();
                      final favoritesBloc = context
                          .read<GetFavoriteMoviesBloc>();

                      // Profil bilgilerini yenile
                      profileBloc.add(const GetProfileRequested());
                      // Favori filmleri yenile
                      favoritesBloc.add(const GetFavoriteMoviesRequested());
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 200,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(bottom: navBarHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.verticalSpace,
                              const UserHeaderRow(),
                              28.verticalSpace,
                              const FavoritesSection(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
