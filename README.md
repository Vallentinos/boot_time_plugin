# boot_time_plugin

[![pub.dev](https://img.shields.io/pub/v/boot_time_plugin.svg)](https://pub.dev/packages/boot_time_plugin)
[![platform](https://img.shields.io/badge/platform-android%20%7C%20ios-blue.svg)](https://pub.dev/packages/boot_time_plugin)

A simple Flutter plugin that provides the **device's last boot time** on Android and iOS.

---

## 🔧 Use Cases

- Detect device reboots
- Measure uptime or session length
- Reset logs, counters, or timers on reboot
- Store boot time or runtime for analytics and diagnostics

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  boot_time_plugin: ^1.0.0
```

---

## 🚀 Usage

```dart
import 'package:boot_time_plugin/boot_time_plugin.dart';

// Get boot time as DateTime (recommended)
final DateTime bootTime = await BootTimePlugin.getBootTime();

// Get boot time as milliseconds since epoch
final int bootTimeMs = await BootTimePlugin.getBootTimeMs();

// Get runtime (uptime) since last reboot as Duration
final Duration runTime = await BootTimePlugin.getRunTime();

// Get runtime (uptime) since last reboot in milliseconds
final int runTimeMs = await BootTimePlugin.getRunTimeMs();
```

---

## 📱 Platform Support

| Feature         | Android | iOS |
|-----------------|---------|-----|
| Boot time       | ✅       | ✅   |
| Runtime (uptime) | ✅       | ✅   |

---

## 💡 Notes

- All time values are in **milliseconds** unless otherwise stated.
- `getRunTime()` returns a `Duration`, while `getRunTimeMs()` returns raw `int` milliseconds.
- `getBootTime()` calculates:
    - On Android: `System.currentTimeMillis() - elapsedRealtime()`
    - On iOS: `Date() - ProcessInfo.systemUptime`

---

## 📜 License

MIT License. See [LICENSE](LICENSE) for details.

