import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/authentication/domain/usecases/user_login_use_case.dart';
import 'package:shartflix/core/network/token_storage/token_storage.dart';

import '../../../../../core/network/dependy_injection/injection.dart';
import '../../../../../core/services/firebase_services/analytics_service.dart';
import 'login_event.dart';
import 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TokenStorage get _tokenStorage => getIt<TokenStorage>();

  LoginBloc() : super(const LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LoginReset>(_onLoginReset);
  }
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(const LoginLoading());
    try {
      final loginResponse = await UserLoginUseCase().call(event.loginRequest);
      if (loginResponse.user.token != null) {
        await _tokenStorage.saveAccessToken(loginResponse.user.token!);
      }

      await FirebaseAnalyticsService().logEvent(
        AnalyticsEventNames.login,
        parameters: {'email': event.loginRequest.email},
      );

      emit(LoginSuccess(loginResponse: loginResponse));
    } catch (error) {
      emit(LoginFailure(errorMessage: error.toString()));
    }
  }

  void _onLoginReset(LoginReset event, Emitter<LoginState> emit) {
    emit(const LoginInitial());
  }
}
