package com.example.flutteruitest

import android.app.Activity
import android.os.Bundle
import android.widget.Button
import channel.AndroidToFlutter

class AndroidToFlutterActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_android_to_flutter)
        val btn : Button = findViewById(R.id.btn_install);
        btn.setOnClickListener {
            AndroidToFlutter.install();
        }
    }

}