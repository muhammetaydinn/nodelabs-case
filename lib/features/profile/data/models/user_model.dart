import 'package:shartflix/features/profile/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String? id,
    required String? name,
    required String? email,
    required String? photoUrl,
    required String? token,
  }) : super(
         id: id,
         name: name,
         email: email,
         photoUrl: photoUrl,
         token: token,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photoUrl'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'token': token,
    };
  }
}
