import 'package:ecommerce_app/core/cache/secure_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageCacheing {
  static const _storage = FlutterSecureStorage();

  Future<void> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required DateTime expiresAt,
  }) async {
    await _storage.write(key: SecureKeys.accessToken, value: accessToken);
    await _storage.write(
      key: SecureKeys.expiresAt,
      value: expiresAt.toIso8601String(),
    );
    await _storage.write(key: SecureKeys.refreshToken, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    final accessToken = await _storage.read(key: SecureKeys.accessToken);
    return accessToken;
  }

  Future<String?> getRefreshToken() async {
    final refreshToken = await _storage.read(key: SecureKeys.refreshToken);
    return refreshToken;
  }

  Future<DateTime?> getExpireAtToken() async {
    final expiresAt = await _storage.read(key: SecureKeys.expiresAt);
    return expiresAt != null ? DateTime.parse(expiresAt) : null;
  }

  Future<void> clearCache() async {
    await _storage.delete(key: SecureKeys.accessToken);
    await _storage.delete(key: SecureKeys.refreshToken);
    await _storage.delete(key: SecureKeys.expiresAt);
  }
}
