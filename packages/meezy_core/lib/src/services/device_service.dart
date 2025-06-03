import 'package:flutter_udid/flutter_udid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceService {
  static const _deviceIdKey = 'device_id';
  String? _deviceId;

  DeviceService._internal();

  static DeviceService get instance => _instance;
  static final DeviceService _instance = DeviceService._internal();

  Future<void> init(SharedPreferences prefs) async {
    _deviceId = prefs.getString(_deviceIdKey);
    if (_deviceId == null) {
      _deviceId = await _generateDeviceId();
      await prefs.setString(_deviceIdKey, _deviceId!);
    }
  }

  String get deviceId {
    ArgumentError.checkNotNull(_deviceId, 'deviceId');
    return _deviceId!;
  }

  Future<String> _generateDeviceId() async => FlutterUdid.udid;
}
