import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams {}

class PaginationRequest extends Equatable {
  final int page;

  const PaginationRequest({
    required this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
    };
  }

  @override
  List<Object?> get props => [page];
}
