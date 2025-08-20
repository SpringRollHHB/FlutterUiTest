package com.example.flutteruitest

import android.content.Context
import android.view.View
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory
import com.example.flutteruitest.view.NativeVideoView

class NativeVideoViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val params = args as? Map<String, Any>
        val url = params?.get("url") as? String

        return object : PlatformView {
            private val videoView = NativeVideoView(context, url)

            override fun getView(): View {
                return videoView
            }

            override fun dispose() {
                videoView.stopPlayback()
            }
        }
    }
}
