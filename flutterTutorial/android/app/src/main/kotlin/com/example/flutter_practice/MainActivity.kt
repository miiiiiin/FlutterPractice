package com.example.flutter_practice

//import androidx.annotation.NonNull;
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {


    companion object {
        const val CHANNEL = "example.com/value"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL)
                .setMethodCallHandler { methodCall, result ->
                    if (methodCall.method == "getValue") {
                        result.success("성공")
                    } else {
                        result.notImplemented()
                    }
                }
    }

//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
//    }
}
