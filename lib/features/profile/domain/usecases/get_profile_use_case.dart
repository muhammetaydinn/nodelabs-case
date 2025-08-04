import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/profile/domain/entities/user.dart';
import 'package:shartflix/features/profile/domain/repository/profile_repository.dart';

@Injectable()
class GetProfileUseCase implements UseCase<User, NoParams> {
  final ProfileRepository _repository;

  GetProfileUseCase(this._repository);

  @override
  Future<User> call(NoParams params) async {
    return await _repository.getProfile();
  }
}
