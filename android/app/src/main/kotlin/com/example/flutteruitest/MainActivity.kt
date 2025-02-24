package com.example.flutteruitest

import android.content.res.Configuration
import channel.FlutterToAndroidPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.util.GeneratedPluginRegister

class MainActivity: FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(FlutterToAndroidPlugin())
        super.configureFlutterEngine(flutterEngine)
    }

}
