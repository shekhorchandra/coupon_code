import Flutter
import UIKit
import UserNotifications
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    // GMSServices.provideAPIKey("AIzaSyBU6apS6bCfXAcAeNmP6uvCjVwsurlzG-I")
    GMSServices.provideAPIKey("AIzaSyC-2HKwdQBQmiJHC-5MpTh_u8Ia1HdYf3s")
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
