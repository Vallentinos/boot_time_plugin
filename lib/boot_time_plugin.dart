
import 'package:flutter/services.dart';
import 'boot_time_plugin_platform_interface.dart';


class BootTimePlugin {
  static const String name = 'boot_time_plugin';
  static const MethodChannel _channel = MethodChannel(name);

  /// Returns the platform version (e.g., "Android 13").
  /// Optional: provided by your platform interface.
  Future<String?> getPlatformVersion() {
    return BootTimePluginPlatform.instance.getPlatformVersion();
  }

  /// Returns the device's last boot time as [DateTime].
  static Future<DateTime> getBootTime() async {
    final int bootTimeMillis = await _channel.invokeMethod('getBootTime');
    return DateTime.fromMillisecondsSinceEpoch(bootTimeMillis);
  }

  static Future<int> getBootTimeMilliseconds() async {
    return await _channel.invokeMethod('getBootTime');
  }

}


