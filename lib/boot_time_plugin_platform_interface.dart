import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'boot_time_plugin_method_channel.dart';
import 'dart:async';

abstract class BootTimePluginPlatform extends PlatformInterface {
  /// Constructs a BootTimePluginPlatform.
  BootTimePluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BootTimePluginPlatform _instance = MethodChannelBootTimePlugin();

  /// The default instance of [BootTimePluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBootTimePlugin].
  static BootTimePluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BootTimePluginPlatform] when
  /// they register themselves.
  static set instance(BootTimePluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
