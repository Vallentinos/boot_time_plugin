import 'package:flutter_test/flutter_test.dart';
import 'package:boot_time_plugin/boot_time_plugin.dart';
import 'package:boot_time_plugin/boot_time_plugin_platform_interface.dart';
import 'package:boot_time_plugin/boot_time_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBootTimePluginPlatform
    with MockPlatformInterfaceMixin
    implements BootTimePluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BootTimePluginPlatform initialPlatform = BootTimePluginPlatform.instance;

  test('$MethodChannelBootTimePlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBootTimePlugin>());
  });

  test('getPlatformVersion', () async {
    BootTimePlugin bootTimePlugin = BootTimePlugin();
    MockBootTimePluginPlatform fakePlatform = MockBootTimePluginPlatform();
    BootTimePluginPlatform.instance = fakePlatform;

    expect(await bootTimePlugin.getPlatformVersion(), '42');
  });
}
