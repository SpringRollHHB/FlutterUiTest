package com.example.flutteruitest.view

import android.content.Context
import android.net.Uri
import android.widget.VideoView

class NativeVideoView(context: Context, url: String?) : VideoView(context) {
    init {
        url?.let {
            setVideoURI(Uri.parse(it))
            setOnPreparedListener { mp ->
                mp.isLooping = true
                start() // 自动播放
            }
        }
    }
}
