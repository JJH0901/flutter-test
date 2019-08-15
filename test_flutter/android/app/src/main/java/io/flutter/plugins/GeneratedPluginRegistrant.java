package io.flutter.plugins;

import android.content.Context;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.view.FlutterView;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
    public static final String METHOD_CHANNEL = "testflutter";
    public static final String EVENT_CHANNEL = "charging";

    public static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
    }

    public static void registerWith(PluginRegistry registry, Context context, FlutterView flutterView) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }

        FlutterPluginBatteryLevel plugin = new FlutterPluginBatteryLevel(context);
        MethodChannel methodChannel = new MethodChannel(flutterView, METHOD_CHANNEL);
        methodChannel.setMethodCallHandler(plugin);

        EventChannel eventChannel = new EventChannel(flutterView, METHOD_CHANNEL);
        eventChannel.setStreamHandler(plugin);
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = GeneratedPluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}