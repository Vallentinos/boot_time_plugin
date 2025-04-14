import 'package:flutter/material.dart';
import 'dart:async';

// import 'package:flutter/services.dart';
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
  final BootTimePlugin _plugin = BootTimePlugin();
  late Future<Map<String, String>> _infoFuture;

  @override
  void initState() {
    super.initState();
    _infoFuture = _loadInfo();
  }

  Future<Map<String, String>> _loadInfo() async {
    String platformVersion = 'Unknown';
    String bootTimeStr = 'Unavailable';

    try {
      platformVersion =
          await _plugin.getPlatformVersion() ?? 'Unknown platform version';

      final DateTime bootTime = await BootTimePlugin.getBootTime();
      bootTimeStr = bootTime.toString();
    } catch (e) {
      platformVersion = 'Error: $e';
    }

    return {
      'platformVersion': platformVersion,
      'bootTime': bootTimeStr,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Platform Version: ${data['platformVersion']}'),
                const SizedBox(height: 16),
                Text('Boot Time: ${data['bootTime']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
