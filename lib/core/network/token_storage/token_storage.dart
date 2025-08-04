import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
@singleton
class TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorage()
    : _storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
          resetOnError: true,
        ),
        iOptions: IOSOptions(
          accessibility: KeychainAccessibility.first_unlock,
        ),
      );

  static const _accessToken = 'accessToken';

  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessToken);
  }

  Future<void> deleteAccessToken() async {
    await _storage.delete(key: _accessToken);
  }

  Future<void> clearAllTokens() async {
    await _storage.deleteAll();
  }
}
