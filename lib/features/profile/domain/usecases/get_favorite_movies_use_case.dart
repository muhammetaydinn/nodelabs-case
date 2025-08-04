import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';
import 'package:shartflix/features/profile/domain/repository/profile_repository.dart';

import '../../../../core/network/dependy_injection/injection.dart';

@Injectable()
class GetFavoriteMoviesUseCase implements UseCase<MovieResponse, NoParams> {
  ProfileRepository get profileRepository => getIt<ProfileRepository>();

  GetFavoriteMoviesUseCase();

  @override
  Future<MovieResponse> call(NoParams params) async {
    return await profileRepository.getFavoriteMovies();
  }
}
