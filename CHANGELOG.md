## [1.0.0] - 2025-05-20

🎉 Initial stable release

### 🚀 Features
- Provides device **boot time** as both `DateTime` and raw milliseconds.
- Provides **runtime (uptime)** since last reboot as `Duration` or milliseconds.
- Cross-platform support for **Android** and **iOS**.

### ✨ Improvements
- Introduced `getRunTime()` that returns a `Duration`.
- Introduced `getRunTimeMs()` that returns a `Int`.
- Renamed `getBootTimeMilliseconds` ➜ `getBootTimeMs` for clarity and consistency.
- Standardized time units across platforms (milliseconds).

### ✅ Breaking Changes
- None — all previous method names retained (if they existed before pre-1.0.0 versions).

### 📦 Notes
- This version marks the **first stable (1.0.0) release**.
- Compatible with the latest versions of Flutter SDK and platform APIs.
- Ideal for production apps needing uptime or boot tracking.

