import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helpers/preferences_helper/preferences_dao.dart';
import 'dto/token.dart';

/// [TokenStorage] stores and manages the Auth token.
abstract interface class TokenStorage<T> {
  Future<T?> load();

  Future<void> save(T tokenPair);

  Future<void> clear();

  Stream<T?> getStream();

  Future<void> close();
}

final class TokenStorageSP implements TokenStorage<Token> {
  TokenStorageSP({required SharedPreferences sharedPreferences})
      : _accessToken = TypedEntry(
          sharedPreferences: sharedPreferences,
          key: 'authorization.access_token',
        ),
        _refreshToken = TypedEntry(
          sharedPreferences: sharedPreferences,
          key: 'authorization.refresh_token',
        );

  late final PreferencesEntry<String> _accessToken;
  late final PreferencesEntry<String> _refreshToken;
  final _streamController = StreamController<Token?>.broadcast();

  @override
  Future<Token?> load() async {
    final accessToken = _accessToken.read();
    final refreshToken = _refreshToken.read();

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    return Token(accessToken, refreshToken);
  }

  @override
  Future<void> save(Token tokenPair) async {
    await (
      _accessToken.set(tokenPair.accessToken),
      _refreshToken.set(tokenPair.refreshToken)
    ).wait;

    _streamController.add(tokenPair);
  }

  @override
  Future<void> clear() async {
    await (_accessToken.remove(), _refreshToken.remove()).wait;
    _streamController.add(null);
  }

  @override
  Stream<Token?> getStream() => _streamController.stream;

  @override
  Future<void> close() => _streamController.close();
}

final class TypedEntry extends PreferencesEntry<String> {
  final SharedPreferences sharedPreferences;
  final String key;

  TypedEntry({required this.sharedPreferences, required this.key});

  @override
  String? read() {
    throw UnimplementedError();
  }

  @override
  Future<void> remove() {
    throw UnimplementedError();
  }

  @override
  Future<void> set(String value) {
    throw UnimplementedError();
  }
}
