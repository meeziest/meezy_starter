import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

/// [LocaleDataSource] is an entry point to the locale data layer.
/// This is used to set and get locale.
abstract interface class LocaleDataSource {
  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Get current locale from cache
  Locale? loadLocaleFromCache();
}

final class LocaleDataSourceSP implements LocaleDataSource {
  final SharedPreferences _sharedPreferences;

  const LocaleDataSourceSP(
    SharedPreferences sharedPreferences,
  ) : _sharedPreferences = sharedPreferences;

  static const _prefix = 'locale';

  @override
  Future<void> setLocale(Locale locale) async {
    await _sharedPreferences.setString(
      '$_prefix.locale',
      locale.toString(),
    );

    return;
  }

  @override
  Locale? loadLocaleFromCache() {
    final locale = _sharedPreferences.getString('$_prefix.locale');

    if (locale != null) {
      final localeParts = locale.split('_');
      return Locale.fromSubtags(
        languageCode: localeParts[0],
        countryCode: localeParts.length > 1 ? localeParts[1] : null,
      );
    }

    return null;
  }
}
