import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/domain/entities/favorite_movie_response.dart';
import 'package:shartflix/features/home/domain/repository/home_repository.dart';
import '../../../../core/network/dependy_injection/injection.dart';

@Injectable()
class SetMovieFavoriteUseCase
    implements UseCase<FavoriteMovieResponse, SetMovieFavoriteParams> {
  HomeRepository get homeRepository => getIt<HomeRepository>();

  SetMovieFavoriteUseCase();

  @override
  Future<FavoriteMovieResponse> call(SetMovieFavoriteParams params) async {
    return await homeRepository.setMovieFavorite(params.movieId);
  }
}

class SetMovieFavoriteParams {
  final String movieId;

  SetMovieFavoriteParams({required this.movieId});
}
