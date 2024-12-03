abstract class TokenRepository {
  Future<void> cacheAccessToken(String token);

  Future<void> cacheRefreshToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> deleteAccessToken();

  Future<void> deleteRefreshToken();

  Future<void> deleteAllTokens();
}
