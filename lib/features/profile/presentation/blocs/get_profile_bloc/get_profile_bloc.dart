import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/network/utils/generic_use_case.dart';
import 'package:shartflix/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_event.dart';
import 'package:shartflix/features/profile/presentation/blocs/get_profile_bloc/get_profile_state.dart';

@Injectable()
class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final GetProfileUseCase _getProfileUseCase;

  GetProfileBloc(this._getProfileUseCase) : super(const GetProfileInitial()) {
    on<GetProfileRequested>(_onGetProfileRequested);
    on<GetProfileReset>(_onGetProfileReset);
  }

  Future<void> _onGetProfileRequested(
    GetProfileRequested event,
    Emitter<GetProfileState> emit,
  ) async {
    emit(const GetProfileLoading());

    try {
      final user = await _getProfileUseCase(NoParams());

      emit(GetProfileSuccess(user: user));
    } catch (error) {
      emit(GetProfileFailure(errorMessage: error.toString()));
    }
  }

  void _onGetProfileReset(
    GetProfileReset event,
    Emitter<GetProfileState> emit,
  ) {
    emit(const GetProfileInitial());
  }
}
