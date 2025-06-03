import 'package:intl/intl.dart';
import 'package:quiver/time.dart' as quiver_time;

/// Returns [DateTime] in UTC containing Time.
DateTime time({
  int hour = 0,
  int minute = 0,
  int second = 0,
  int millisecond = 0,
  int microsecond = 0,
}) =>
    DateTime.utc(
      0,
      1,
      1,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );

/// Represents the smallest possible value of DateTime. This field is read-only.
final DateTime minDateTimeValue = DateTime.fromMicrosecondsSinceEpoch(-8640000172800000);

/// Represents the largest possible value of DateTime. This field is read-only.
final DateTime maxDateTimeValue = DateTime.utc(275760, 09, 13);

/// The value of this constant is equivalent to 00:00:00.0000000 UTC, January 1, 1970, in the Gregorian calendar. UnixEpoch defines the point in time when Unix time is equal to 0.
final DateTime unixEpoch = DateTime.utc(0);

extension NullableDateTimeExtension on DateTime? {
  /// Returns true if two [DateTime] has the same date.
  bool isSameDay(DateTime? date) {
    if (this == null || date == null) return false;

    return this!.day == date.day && this!.month == date.month && this!.year == date.year;
  }

  /// Returns true if two [DateTime] has the same time.
  bool isSameTime(DateTime? time) {
    if (this == null || time == null) return false;

    return this!.hour == time.hour && this!.minute == time.minute;
  }

  /// Checks if this date is the same day as or after the given [date].
  ///
  /// Returns true if this date is the same day as or after the given [date]; otherwise, returns false.
  bool isSameDayOrAfter(DateTime? date) {
    if (this == null || date == null) return false;

    return isSameDay(date) || this!.isAfter(date);
  }

  /// Checks if this date is the same day as or before the given [date].
  ///
  /// Returns true if this date is the same day as or before the given [date]; otherwise, returns false.
  bool isSameDayOrBefore(DateTime? date) {
    if (this == null || date == null) return false;

    return isSameDay(date) || this!.isBefore(date);
  }

  /// Checks if this date is the same as or after the given [date].
  ///
  /// Returns true if this date is the same as or after the given [date]; otherwise, returns false.
  bool isSameOrAfter(DateTime? date) {
    if (this == null || date == null) return false;

    return this == date || this!.isAfter(date);
  }

  /// Checks if this date is the same as or before the given [date].
  ///
  /// Returns true if this date is the same as or before the given [date]; otherwise, returns false.
  bool isSameOrBefore(DateTime? date) {
    if (this == null || date == null) return false;

    return this == date || this!.isBefore(date);
  }
}

extension DateTimeExtension on DateTime {
  /// Gets the day of the week represented by this instance.

  /// The day of the year, expressed as a value between 1 and 366.
  int get dayOfYear {
    final beginningOfYear = DateTime(year);
    final difference = this.difference(beginningOfYear).inDays;
    return difference + 1; // Adding 1 because the difference is 0-based.
  }

  /// Returns the number of days in the specified month and year.
  int get daysInMonth => quiver_time.daysInMonth(year, month);

  /// Returns true if [year] is a leap year.
  ///
  /// This implements the Gregorian calendar leap year rules wherein a year is considered to be a leap year if it is divisible by 4, excepting years divisible by 100, but including years divisible by 400.
  ///
  /// This function assumes the use of the Gregorian calendar or the proleptic Gregorian calendar.
  bool get isLeapYear => quiver_time.isLeapYear(year);

  /// Return [DateTime] with changed time only.
  DateTime withTime(DateTime time) {
    return copyWith(
      hour: time.hour,
      minute: time.minute,
      second: time.second,
      millisecond: time.millisecond,
      microsecond: time.microsecond,
    );
  }

  /// Return [DateTime] with changed date only.
  DateTime withDate(DateTime date) {
    return copyWith(
      year: date.year,
      month: date.month,
      day: date.day,
    );
  }

  String getTimeZoneOffset() {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final duration = timeZoneOffset;
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60).abs();

    return '${hours > 0 ? '+' : '-'}${twoDigits(hours.abs())}:${twoDigits(minutes)}';
  }

  /// Returns [DateTime] in UTC containing only Date.
  DateTime toDate() {
    return DateTime.utc(year, month, day);
  }

  /// Returns [DateTime] in UTC containing only Date.
  DateTime toKzDate() {
    final utc = toUtc();
    return DateTime.utc(utc.year, utc.month, utc.day, utc.hour - 5);
  }

  /// Returns new [DateTime] in UTC containing only Time.
  DateTime toTime() {
    return DateTime.utc(
      0,
      1,
      1,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Checks if this date is the last day of the month.
  ///
  /// Returns true if this date is the last day of the month; otherwise, returns false.
  bool isLastDayOfMonth() => isSameDay(lastDayOfMonth);

  /// Gets the last day of the month for this date.
  DateTime get lastDayOfMonth => copyWith(day: daysInMonth);

  /// Gets the first day of the month for this date.
  DateTime get firstDayOfMonth => copyWith(day: 1);
}

/// Converts ISO date to readable format (yyyy-MM-dd'T'HH:mm:ssXXX  -> dd.MM.yyyy)
/// If the date is not valid, returns empty string
String convertIsoDate(String date) {
  try {
    return DateFormat('dd.MM.yyyy').format(DateTime.parse(date));
  } on Exception catch (_) {
    return '';
  }
}

/// Converts DateTime to readable format (HH:mm)
String covertDateToTimeHHMM(DateTime date) {
  try {
    return DateFormat('HH:mm').format(date);
  } on Exception catch (_) {
    return '';
  }
}

DateTime? tryParseDdMmYyyyFormatDate(String? value) {
  if (value == null || value.isEmpty) return null;

  final numbers = value.split('.').map((it) => int.parse(it)).toList();

  if (numbers.length == 3) {
    return DateTime(
      numbers[2],
      numbers[1],
      numbers[0],
    );
  }

  return null;
}

extension DateTimExt on DateTime? {
  bool isAtSameDayAs(DateTime date) {
    if (this == null) return false;
    return this!.day == date.day &&
        this!.year == date.year &&
        this!.month == date.month;
  }
}
