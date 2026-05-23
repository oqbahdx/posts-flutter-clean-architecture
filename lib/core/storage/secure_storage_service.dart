import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../constants/api_constants.dart';

abstract class SecureStorageService {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> saveUserId(String userId);
  Future<String?> getUserId();
  Future<void> saveEmail(String email);
  Future<String?> getEmail();
  Future<void> clear();
  Future<bool> hasToken();
}

@LazySingleton(as: SecureStorageService)
class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageServiceImpl(this._storage);

  @override
  Future<void> saveToken(String token) =>
      _storage.write(key: ApiConstants.tokenKey, value: token);

  @override
  Future<String?> getToken() => _storage.read(key: ApiConstants.tokenKey);

  @override
  Future<void> saveUserId(String userId) =>
      _storage.write(key: ApiConstants.userIdKey, value: userId);

  @override
  Future<String?> getUserId() => _storage.read(key: ApiConstants.userIdKey);

  @override
  Future<void> saveEmail(String email) =>
      _storage.write(key: ApiConstants.emailKey, value: email);

  @override
  Future<String?> getEmail() => _storage.read(key: ApiConstants.emailKey);

  @override
  Future<void> clear() => _storage.deleteAll();

  @override
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
