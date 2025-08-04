import 'package:shartflix/features/authentication/domain/entities/register_response.dart';
import 'package:shartflix/features/profile/data/models/user_model.dart';

class RegisterResponseModel extends RegisterResponse {
  const RegisterResponseModel({required UserModel user}) : super(user: user);

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(user: UserModel.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    return (user as UserModel).toJson();
  }
}
