import 'package:flutter/material.dart';
import 'package:boot_time_plugin/boot_time_plugin.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BootTimeScreen(),
    );
  }
}

class BootTimeScreen extends StatefulWidget {
  const BootTimeScreen({super.key});

  @override
  State<BootTimeScreen> createState() => _BootTimeScreenState();
}

class _BootTimeScreenState extends State<BootTimeScreen> {
  late Future<Map<String, String>> _infoFuture;

  @override
  void initState() {
    super.initState();
    _infoFuture = _loadInfo();
  }

  Future<Map<String, String>> _loadInfo() async {
    String platformVersion = 'Unknown';
    String bootTimeStr = 'Unavailable';
    String bootTimeMillisStr = 'Unavailable';
    String runTimeStr = 'Unavailable';
    String runTimeMillisStr = 'Unavailable';

    try {
      platformVersion =
          await BootTimePlugin().getPlatformVersion() ?? 'Unknown platform version';

      final DateTime bootTime = await BootTimePlugin.getBootTime();
      final int bootTimeMillis = await BootTimePlugin.getBootTimeMs();
      final Duration runTime = await BootTimePlugin.getRunTime();
      final int runTimeMillis = await BootTimePlugin.getRunTimeMs();

      bootTimeStr = bootTime.toString();
      bootTimeMillisStr = bootTimeMillis.toString();
      runTimeStr = runTime.toString();
      runTimeMillisStr = runTimeMillis.toString();
    } catch (e) {
      platformVersion = 'Error: $e';
    }

    return {
      'platformVersion': platformVersion,
      'bootTime': bootTimeStr,
      'bootTimeMillis': bootTimeMillisStr,
      'runTime': runTimeStr,
      'runTimeMillis': runTimeMillisStr,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boot Time Plugin Example')),
      body: FutureBuilder<Map<String, String>>(
        future: _infoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🔧 Device Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text('Platform Version: ${data['platformVersion']}'),
                const SizedBox(height: 24),
                const Text(
                  '⏱ Boot Time',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text('Boot Time (DateTime): ${data['bootTime']}'),
                const SizedBox(height: 8),
                Text('Boot Time (ms): ${data['bootTimeMillis']}'),
                const SizedBox(height: 24),
                const Text(
                  '⚙️ Runtime (Since Boot)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text('Run Time (Duration): ${data['runTime']}'),
                const SizedBox(height: 8),
                Text('Run Time (ms): ${data['runTimeMillis']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}