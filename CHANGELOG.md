## 0.0.5

✨ New method added: `getBootTimeMilliseconds()`

- Returns boot time as `int` (milliseconds since epoch)
- Useful for storing in SharedPreferences or local DBs
- Add millisecond example. 

### New Method Usage
final int bootTimeMillis = await BootTimePlugin.getBootTimeMilliseconds();