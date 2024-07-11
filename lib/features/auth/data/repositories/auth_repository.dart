import '../../../../core/auth/interceptors/auth_interceptor.dart';
import '../../../../core/auth/token_local.dart';
import '../data_sources/auth_data_source.dart';

/// AuthStatusSource is used to get the status of the authentication
abstract interface class AuthStatusSource {
  /// Stream of [AuthenticationStatus]
  Stream<AuthenticationStatus> get authStatus;
}

/// AuthRepository
abstract interface class AuthRepository<T> implements AuthStatusSource {
  /// Sign in with email and password
  Future<T> signIn(String email, String password);

  /// Sign up with email and password
  Future<void> signUp(String email, String password);

  /// Sign out
  Future<void> signOut();
}

/// AuthRepositoryImpl
final class AuthRepositoryImpl<T> implements AuthRepository<T> {
  final AuthDataSource<T> _dataSource;
  final TokenStorage<T> _storage;

  /// Create an [AuthRepositoryImpl]
  const AuthRepositoryImpl({
    required AuthDataSource<T> dataSource,
    required TokenStorage<T> storage,
  })  : _dataSource = dataSource,
        _storage = storage;

  @override
  Future<void> signUp(String email, String password) async {
    await _dataSource.signUp(email, password);
  }

  @override
  Future<T> signIn(String email, String password) async {
    final token = await _dataSource.signIn(email, password);
    await _storage.save(token);

    return token;
  }

  @override
  Future<void> signOut() async {
    await _storage.clear();
  }

  @override
  Stream<AuthenticationStatus> get authStatus => _storage.stream.map(
        (token) => token != null //
            ? AuthenticationStatus.authenticated
            : AuthenticationStatus.unauthenticated,
      );
}
