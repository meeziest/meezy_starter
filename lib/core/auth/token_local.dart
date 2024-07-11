import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helpers/preferences_helper/preferences_dao.dart';
import 'dto/token.dart';

/// [TokenStorage] stores and manages the Auth token.
abstract interface class TokenStorage<T> {
  Future<T?> load();

  Future<void> save(T tokenPair);

  Future<void> clear();

  Stream<T?> get stream;

  Future<void> close();
}

final class TokenStorageSP implements TokenStorage<Token> {
  TokenStorageSP({required SharedPreferences sharedPreferences}) {
    _accessToken = TypedEntry(
      sharedPreferences: sharedPreferences,
      key: 'authorization.access_token',
    );
    _refreshToken = TypedEntry(
      sharedPreferences: sharedPreferences,
      key: 'authorization.refresh_token',
    );
    load().then((token) => _subject.add(token));
  }

  late final PreferencesEntry<String> _accessToken;
  late final PreferencesEntry<String> _refreshToken;

  final _subject = BehaviorSubject<Token?>.seeded(null);

  @override
  Stream<Token?> get stream => _subject.stream;

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
      _refreshToken.set(tokenPair.refreshToken),
    ).wait;

    _subject.add(tokenPair);
  }

  @override
  Future<void> clear() async {
    await (_accessToken.remove(), _refreshToken.remove()).wait;
    _subject.add(null);
  }

  @override
  Future<void> close() => _subject.close();
}

final class TypedEntry extends PreferencesEntry<String> {
  final SharedPreferences sharedPreferences;

  @override
  final String key;

  TypedEntry({required this.sharedPreferences, required this.key});

  @override
  String? read() {
    return sharedPreferences.getString(key);
  }

  @override
  Future<void> remove() {
    return sharedPreferences.remove(key);
  }

  @override
  Future<void> set(String value) {
    return sharedPreferences.setString(key, value);
  }
}
