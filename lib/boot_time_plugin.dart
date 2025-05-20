
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

  /// Short alias for [getBootTimeMilliseconds].
  static Future<int> getBootTimeMs() async {
    return await _channel.invokeMethod('getBootTime');
  }

  /// to get passed time From rebooted (ElapsedRealtime or Runtime)
  static Future<int> getRunTimeMs() async {
    return await _channel.invokeMethod('getRunTimeMs');
  }

  /// to get passed time From rebooted as Duration
  static Future<Duration> getRunTime() async {
    final int runTimeMs = await _channel.invokeMethod('getRunTimeMs');
    return Duration(milliseconds: runTimeMs);
  }

}


