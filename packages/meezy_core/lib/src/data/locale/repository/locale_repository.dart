import 'dart:ui';

import '../data_source/locale_local_data_source.dart';

abstract interface class LocaleRepository {
  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Get current locale from cache
  Locale? loadLocale();
}

final class LocaleRepositoryImpl implements LocaleRepository {
  final LocaleDataSource _localeDataSource;

  const LocaleRepositoryImpl(this._localeDataSource);

  @override
  Future<void> setLocale(Locale locale) => _localeDataSource.setLocale(locale);

  @override
  Locale? loadLocale() => _localeDataSource.loadLocaleFromCache();
}
