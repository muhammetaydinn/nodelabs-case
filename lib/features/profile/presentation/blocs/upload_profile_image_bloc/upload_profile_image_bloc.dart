import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/profile/domain/usecases/upload_profile_image_use_case.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_event.dart';
import 'package:shartflix/features/profile/presentation/blocs/upload_profile_image_bloc/upload_profile_image_state.dart';

@Injectable()
class UploadProfileImageBloc
    extends Bloc<UploadProfileImageEvent, UploadProfileImageState> {
  UploadProfileImageBloc() : super(const UploadProfileImageInitial()) {
    on<UploadProfileImageRequested>(_onUploadProfileImageRequested);
    on<UploadProfileImageReset>(_onUploadProfileImageReset);
  }

  Future<void> _onUploadProfileImageRequested(
    UploadProfileImageRequested event,
    Emitter<UploadProfileImageState> emit,
  ) async {
    emit(const UploadProfileImageLoading());

    try {
      final updatedUser = await UploadProfileImageUseCase().call(
        event.uploadRequest,
      );

      emit(UploadProfileImageSuccess(updatedUser: updatedUser));
    } catch (error) {
      emit(UploadProfileImageFailure(errorMessage: error.toString()));
    }
  }

  void _onUploadProfileImageReset(
    UploadProfileImageReset event,
    Emitter<UploadProfileImageState> emit,
  ) {
    emit(const UploadProfileImageInitial());
  }
}
