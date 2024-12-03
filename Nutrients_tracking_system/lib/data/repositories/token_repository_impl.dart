import 'package:injectable/injectable.dart';

import '../../domain/repositories/token_repository.dart';
import '../data_sources/local_data_source/token_local_data_source.dart';

@LazySingleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  final TokenLocalDataSource _localDataSource;

  TokenRepositoryImpl(this._localDataSource);

  @override
  Future<void> cacheAccessToken(String token) {
    try {
      return _localDataSource.cacheAccessToken(token);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> cacheRefreshToken(String token) {
    try {
      return _localDataSource.cacheRefreshToken(token);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccessToken() {
    try {
      return _localDataSource.deleteAccessToken();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAllTokens() {
    try {
      return _localDataSource.deleteAllTokens();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteRefreshToken() {
    try {
      return _localDataSource.deleteRefreshToken();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getAccessToken() {
    try {
      return _localDataSource.getAccessToken();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String?> getRefreshToken() {
    try {
      return _localDataSource.getRefreshToken();
    } catch (e) {
      rethrow;
    }
  }
}
