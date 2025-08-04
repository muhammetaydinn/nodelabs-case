import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';
import 'package:shartflix/features/home/domain/repository/home_repository.dart';

@Injectable()
class GetMoviesUseCase implements UseCase<MovieResponse, PaginationRequest> {
  final HomeRepository _repository;

  GetMoviesUseCase(this._repository);

  @override
  Future<MovieResponse> call(PaginationRequest params) async {
    return await _repository.getMovies(params);
  }
}
