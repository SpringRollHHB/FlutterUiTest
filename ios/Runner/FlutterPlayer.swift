//
//  FlutterPlayer.swift
//  Runner
//
//  Created by 韩闯 on 2024/9/3.
//

import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return FLNativeView(
            frame: frame,
            viewIdentifier: viewId,
            arguments: args,
            binaryMessenger: messenger)
    }

    /// Implementing this method is only necessary when the `arguments` in `createWithFrame` is not `nil`.
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
          return FlutterStandardMessageCodec.sharedInstance()
    }
}

class FLNativeView: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        _view = UIView()
        _view.frame = UIScreen.main.bounds
        
        super.init()
        // iOS views can be created here
        var url = ""
        if(args != nil){
            url = (args as! Dictionary<String,Any>)["url"] as! String
        }
        print(url)
        
        createNativeView(view: _view,url:url,messenger: messenger)
    }

    func view() -> UIView {
        return _view
    }

    func createNativeView(view _view: UIView,url:String,messenger:FlutterBinaryMessenger?){
        _view.backgroundColor = UIColor.black
        let player = CustomPlayer(frame: _view.frame,url:url,messenger: messenger);
        _view.addSubview(player)
    }
}
