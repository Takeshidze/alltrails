package com.example.alltrails

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("dd6d0863-2ce5-4ba3-94ba-22a90ca22ba9") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}