import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      guard let pluginRegisterar = self.registrar(forPlugin: "plugin-player") else { return false }

      let factory = FLNativeViewFactory(messenger: pluginRegisterar.messenger())
        pluginRegisterar.register(
          factory,
          withId: "swift_player")
        
        
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
