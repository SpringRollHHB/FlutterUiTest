import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
      let videoPlayerChannel = FlutterMethodChannel(name: "flutter.plugins.video.player", binaryMessenger: controller.binaryMessenger)

      //监听来之flutter的调用
      videoPlayerChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        if call.method == "videoPlayerNet" {
                self.navigateToNativePage()
                result("Success")
              } else {
                result(FlutterMethodNotImplemented)
              }
      }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    private func videoPlayerNet() {
      // 实现跳转到原生页面的逻辑
      let viewController = UIViewController()
      viewController.view.backgroundColor = .red
      viewController.title = "iOS Native Page"

      // 获取当前的 FlutterViewController 并进行跳转
      let navigationController = window?.rootViewController as? UINavigationController
      navigationController?.pushViewController(viewController, animated: true)
    }
}
