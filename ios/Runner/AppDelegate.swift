import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller = self.window.rootViewController as! FlutterViewController
    
    let channel = FlutterMethodChannel.init(name: "example.com/value", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { (call, result) in
        if (call.method == "getValue") {
            return result("성공")
        } else {
            result(FlutterMethodNotImplemented)//구현되어있지 않음
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
