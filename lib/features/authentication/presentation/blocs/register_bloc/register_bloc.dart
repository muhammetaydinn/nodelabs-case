import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_register_use_case.dart';
import 'package:shartflix/features/authentication/presentation/blocs/register_bloc/register_event.dart';
import 'package:shartflix/features/authentication/presentation/blocs/register_bloc/register_state.dart';
import 'package:shartflix/core/network/token_storage/token_storage.dart';

import '../../../../../core/network/dependy_injection/injection.dart';
import '../../../../../core/services/firebase_services/analytics_service.dart';

@Injectable()
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  TokenStorage get _tokenStorage => getIt<TokenStorage>();

  RegisterBloc() : super(const RegisterInitial()) {
    on<RegisterRequested>(_onRegisterRequested);
    on<RegisterReset>(_onRegisterReset);
  }

  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterLoading());

    try {
      final registerResponse = await UserRegisterUseCase().call(
        event.registerRequest,
      );

      if (registerResponse.user.token != null) {
        await _tokenStorage.saveAccessToken(registerResponse.user.token!);
      }

      await FirebaseAnalyticsService().logEvent(
        AnalyticsEventNames.register,
        parameters: {
          'email': event.registerRequest.email,
          'name': event.registerRequest.name,
        },
      );

      emit(RegisterSuccess(registerResponse: registerResponse));
    } catch (error) {
      emit(RegisterFailure(errorMessage: error.toString()));
    }
  }

  void _onRegisterReset(RegisterReset event, Emitter<RegisterState> emit) {
    emit(const RegisterInitial());
  }
}
