//
//  FlutterPlugin.swift
//  Runner
//
//  Created by 韩闯 on 2024/9/3.
//

import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "swift_player")
    }
}
