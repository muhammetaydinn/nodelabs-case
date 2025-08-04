// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/authentication/data/datasource/authentication_remote_data_source.dart'
    as _i908;
import '../../../features/authentication/data/repository/authentication_repository_impl.dart'
    as _i363;
import '../../../features/authentication/domain/repository/authentication_repository.dart'
    as _i101;
import '../../../features/authentication/domain/usecases/user_login_use_case.dart'
    as _i168;
import '../../../features/authentication/domain/usecases/user_register_use_case.dart'
    as _i1005;
import '../../../features/authentication/presentation/blocs/login_bloc/login_bloc.dart'
    as _i200;
import '../../../features/authentication/presentation/blocs/register_bloc/register_bloc.dart'
    as _i602;
import '../../../features/home/data/datasource/home_remote_data_source.dart'
    as _i701;
import '../../../features/home/data/repository/home_repository_impl.dart'
    as _i152;
import '../../../features/home/domain/repository/home_repository.dart'
    as _i1023;
import '../../../features/home/domain/usecases/get_movies_use_case.dart'
    as _i149;
import '../../../features/home/domain/usecases/set_movie_favorite_use_case.dart'
    as _i86;
import '../../../features/home/presentation/blocs/favorites_cubit/favorites_cubit.dart'
    as _i287;
import '../../../features/home/presentation/blocs/get_movies_bloc/get_movies_bloc.dart'
    as _i1042;
import '../../../features/home/presentation/blocs/set_movie_favorite_bloc/set_movie_favorite_bloc.dart'
    as _i81;
import '../../../features/profile/data/datasource/profile_remote_data_source.dart'
    as _i56;
import '../../../features/profile/data/repository/profile_repository_impl.dart'
    as _i234;
import '../../../features/profile/domain/repository/profile_repository.dart'
    as _i550;
import '../../../features/profile/domain/usecases/get_favorite_movies_use_case.dart'
    as _i506;
import '../../../features/profile/domain/usecases/get_profile_use_case.dart'
    as _i493;
import '../../../features/profile/domain/usecases/upload_profile_image_use_case.dart'
    as _i196;
import '../../../features/profile/presentation/blocs/get_favorite_movies_bloc/get_favorite_movies_bloc.dart'
    as _i853;
import '../../../features/profile/presentation/blocs/get_profile_bloc/get_profile_bloc.dart'
    as _i480;
import '../../../features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_bloc.dart'
    as _i661;
import '../api_service/api_service.dart' as _i317;
import '../interceptors/token_interceptor.dart' as _i945;
import '../token_storage/token_storage.dart' as _i384;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i384.TokenStorage>(() => _i384.TokenStorage());
    gh.factory<_i168.UserLoginUseCase>(() => _i168.UserLoginUseCase());
    gh.factory<_i1005.UserRegisterUseCase>(() => _i1005.UserRegisterUseCase());
    gh.factory<_i200.LoginBloc>(() => _i200.LoginBloc());
    gh.factory<_i602.RegisterBloc>(() => _i602.RegisterBloc());
    gh.factory<_i86.SetMovieFavoriteUseCase>(
      () => _i86.SetMovieFavoriteUseCase(),
    );
    gh.factory<_i81.SetMovieFavoriteBloc>(() => _i81.SetMovieFavoriteBloc());
    gh.factory<_i506.GetFavoriteMoviesUseCase>(
      () => _i506.GetFavoriteMoviesUseCase(),
    );
    gh.factory<_i196.UploadProfileImageUseCase>(
      () => _i196.UploadProfileImageUseCase(),
    );
    gh.factory<_i661.UploadProfileImageBloc>(
      () => _i661.UploadProfileImageBloc(),
    );
    gh.singleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.factory<_i287.FavoritesCubit>(
      () => _i287.FavoritesCubit(gh<_i86.SetMovieFavoriteUseCase>()),
    );
    gh.singleton<_i945.TokenInterceptor>(
      () => _i945.TokenInterceptor(gh<_i384.TokenStorage>()),
    );
    gh.factory<_i853.GetFavoriteMoviesBloc>(
      () => _i853.GetFavoriteMoviesBloc(
        favoritesCubit: gh<_i287.FavoritesCubit>(),
      ),
    );
    gh.singleton<_i361.Dio>(
      () => registerModule.dio(
        gh<_i384.TokenStorage>(),
        gh<_i945.TokenInterceptor>(),
      ),
    );
    gh.singleton<_i317.ApiService>(
      () => _i317.ApiService(gh<_i361.Dio>(), gh<_i384.TokenStorage>()),
    );
    gh.factory<_i56.ProfileRemoteDataSource>(
      () => _i56.ProfileRemoteDataSourceImpl(gh<_i317.ApiService>()),
    );
    gh.factory<_i550.ProfileRepository>(
      () => _i234.ProfileRepositoryImpl(gh<_i56.ProfileRemoteDataSource>()),
    );
    gh.factory<_i701.HomeRemoteDataSource>(
      () => _i701.HomeRemoteDataSourceImpl(gh<_i317.ApiService>()),
    );
    gh.factory<_i908.AuthenticationRemoteDataSource>(
      () => _i908.AuthenticationRemoteDataSourceImpl(gh<_i317.ApiService>()),
    );
    gh.factory<_i101.AuthenticationRepository>(
      () => _i363.AuthenticationRepositoryImpl(
        gh<_i908.AuthenticationRemoteDataSource>(),
      ),
    );
    gh.factory<_i493.GetProfileUseCase>(
      () => _i493.GetProfileUseCase(gh<_i550.ProfileRepository>()),
    );
    gh.factory<_i1023.HomeRepository>(
      () => _i152.HomeRepositoryImpl(gh<_i701.HomeRemoteDataSource>()),
    );
    gh.factory<_i149.GetMoviesUseCase>(
      () => _i149.GetMoviesUseCase(gh<_i1023.HomeRepository>()),
    );
    gh.factory<_i480.GetProfileBloc>(
      () => _i480.GetProfileBloc(gh<_i493.GetProfileUseCase>()),
    );
    gh.factory<_i1042.GetMoviesBloc>(
      () => _i1042.GetMoviesBloc(gh<_i149.GetMoviesUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i464.RegisterModule {}
