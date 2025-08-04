import 'package:shartflix/features/authentication/domain/entities/login_response.dart';
import 'package:shartflix/features/profile/data/models/user_model.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({required UserModel user}) : super(user: user);

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(user: UserModel.fromJson(json));
  }

  Map<String, dynamic> toJson() {
    return (user as UserModel).toJson();
  }
}
