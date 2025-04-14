import Flutter
import UIKit

public class BootTimePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "boot_time_plugin", binaryMessenger: registrar.messenger())
    let instance = BootTimePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "getBootTime":
      let uptime = ProcessInfo.processInfo.systemUptime
      let bootTime = Date().addingTimeInterval(-uptime).timeIntervalSince1970 * 1000
      result(Int64(bootTime))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
