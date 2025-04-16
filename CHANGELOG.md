## 0.0.6

✨ New method added: `getBootTimeMilliseconds()`

- Returns boot time as `int` (milliseconds since epoch)
- Useful for storing in SharedPreferences or local DBs


README.md updated

---

### New Method Usage

```dart
final int bootTimeMillis = await BootTimePlugin.getBootTimeMilliseconds();
```
---