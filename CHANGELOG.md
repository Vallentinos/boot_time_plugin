## 0.0.4

✨ New method added: `getBootTimeMilliseconds()`

- Returns boot time as `int` (milliseconds since epoch)
- Useful for storing in SharedPreferences or local DBs

### New Method Usage
final int bootTimeMillis = await BootTimePlugin.getBootTimeMilliseconds();