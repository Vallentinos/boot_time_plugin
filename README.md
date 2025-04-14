# boot_time_plugin

[![pub.dev](https://img.shields.io/pub/v/boot_time_plugin.svg)](https://pub.dev/packages/boot_time_plugin)
[![platform](https://img.shields.io/badge/platform-android%20%7C%20ios-blue.svg)](https://pub.dev/packages/boot_time_plugin)

A simple Flutter plugin that provides the **device's last boot time** on Android and iOS.

Useful for:
- Detecting system reboots
- Tracking uptime
- Resetting session logs after reboot


## Installation

Add this to your `pubspec.yaml`:

dependencies:
boot_time_plugin: ^0.0.1



## USAGE
import 'package:boot_time_plugin/boot_time_plugin.dart';

void checkBootTime() async {
final DateTime bootTime = await BootTimePlugin.getBootTime();
print("Device booted at: $bootTime");
}



## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.




