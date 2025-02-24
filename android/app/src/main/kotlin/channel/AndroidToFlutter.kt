package channel

import io.flutter.plugin.common.MethodChannel

object AndroidToFlutter {
    private var channel : MethodChannel? = null;

    fun setChannel(c : MethodChannel?) {
        channel = c
    }

    fun install() {
        channel?.invokeMethod("install","");
    }


}