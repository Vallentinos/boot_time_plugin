# boot_time_plugin

[![pub.dev](https://img.shields.io/pub/v/boot_time_plugin.svg)](https://pub.dev/packages/boot_time_plugin)
[![platform](https://img.shields.io/badge/platform-android%20%7C%20ios-blue.svg)](https://pub.dev/packages/boot_time_plugin)

A simple Flutter plugin that provides the **device's last boot time** on Android and iOS.

Useful for:
- Detect device reboots
- Track uptime or system session length
- Reset counters or logs after a reboot
- Save boot time to persistent storage

---

## Installation

Add this to your `pubspec.yaml`:
```yaml
dependencies:
boot_time_plugin: ^0.0.6
```

## USAGE

```dart
import 'package:boot_time_plugin/boot_time_plugin.dart';
// Get boot time as DateTime (recommended)
final DateTime bootTime = await BootTimePlugin.getBootTime();

// Get boot time as raw milliseconds (for storage or performance)
final int bootTimeMillis = await BootTimePlugin.getBootTimeMilliseconds();
```

---

