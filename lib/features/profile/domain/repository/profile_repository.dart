import 'dart:io';
import 'package:shartflix/features/profile/domain/entities/user.dart';
import 'package:shartflix/features/home/domain/entities/movie_response.dart';

abstract class ProfileRepository {
  Future<User> uploadProfileImage(File imageFile);
  Future<User> getProfile();
  Future<MovieResponse> getFavoriteMovies();
}
