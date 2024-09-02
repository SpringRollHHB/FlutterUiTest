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
                self.videoPlayerNet()
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
      if let flutterViewController = window?.rootViewController as? FlutterViewController {
          // 为 FlutterViewController 包装一个 UINavigationController（如果没有）
          if let navigationController = flutterViewController.navigationController {
              // 如果已有导航控制器，则使用它来推送新页面
              navigationController.pushViewController(viewController, animated: true)
          } else {
              // 如果没有导航控制器，创建一个新的 UINavigationController 并将其设置为根视图控制器
              let navController = UINavigationController(rootViewController: flutterViewController)
              window?.rootViewController = navController
              navController.pushViewController(viewController, animated: true)
          }
       }

    }
}
