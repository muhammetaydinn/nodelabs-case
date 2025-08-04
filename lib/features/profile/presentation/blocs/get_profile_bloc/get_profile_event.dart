import 'package:equatable/equatable.dart';

sealed class GetProfileEvent extends Equatable {
  const GetProfileEvent();

  @override
  List<Object?> get props => [];
}

final class GetProfileRequested extends GetProfileEvent {
  const GetProfileRequested();
}

final class GetProfileReset extends GetProfileEvent {
  const GetProfileReset();
} 